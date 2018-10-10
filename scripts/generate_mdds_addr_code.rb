require 'csv'

# deleting location_hierarchies is a painfull thing, because of parental reference id restrictions imposed.
# hence before you run "sql, make sure you note down the max location_id"
# select max(location_id) from location; 
# if you want to delete the location codes first delete the location attribute for these codes 
# delete from location_attribute where value_reference like "BDLC:%";
# update location set parent_location = null where location_id > <max_location_id_you_noted_down>;
# delete from location where location_id > <max_location_id_you_noted_down>;

class GeoLocation
  attr_reader :code, :level, :name, :geocode, :children
  def initialize(code, level, name, geocode) 
    @code = code
    @level = level
    @parentLevel = level - 1
    @name = name.gsub("'","").strip
    @geocode = geocode
    @children = []
  end
  
  def export_address_entries(parentInfo)
     # puts "#{parentInfo}"
     if @children.length > 0
         nodeInfo = parentInfo.empty? ? "#{@name}^#{@geocode}" : "#{parentInfo}|#{@name}^#{@geocode}"
         @children.each{|child| child.export_address_entries(nodeInfo)}
     else
       # puts "#{parentInfo}|#{@name}^#{@geocode}" if @level==4;
       $address_heirarchies_file.puts("#{parentInfo}|#{@name}^#{@geocode}")
       # return "geocode: #{@geocode}, code : #{@code}, level: #{@level} , name:#{@name}" if @level==4;
     end 
  end

  def export_location_hierarchies
     # return if @level ==1 && @geocode != "60"; 
     if @level == 1
        $bd_location_heirarchies_file.puts "INSERT INTO location (parent_location, name, description, creator, date_created, uuid) VALUES (@rootGeocode, '#{@name}', '#{@name}', 1, curdate(), uuid());"
        $bd_location_heirarchies_file.puts "SET @locationIdLevel#{@level} = last_insert_id();"
     else
        $bd_location_heirarchies_file.puts "INSERT INTO location (parent_location, name, description, creator, date_created, uuid) VALUES (@locationIdLevel#{@parentLevel}, '#{@name}', '#{@name}', 1, curdate(), uuid());"
        $bd_location_heirarchies_file.puts "SET @locationIdLevel#{@level} = last_insert_id();"   
     end
     $bd_location_heirarchies_file.puts "INSERT INTO location_attribute (location_id, attribute_type_id, value_reference, uuid, creator, date_created) " +
     " (SELECT  @locationIdLevel#{@level}, location_attribute_type_id, 'BDLC:#{@geocode}', uuid(), 1, curdate() FROM location_attribute_type WHERE name = 'LocationCode'); "
     if @children.length > 0
        @children.each{|child| child.export_location_hierarchies }
     end
  end 
end


@states = []
def find_or_create_state(state_code, state_name) 
  aState = @states.detect{|s| s.code == state_code}
  if aState.nil?
    aState = GeoLocation.new state_code, 1, state_name, state_code
    @states.push aState
  end
  aState
end


def find_or_create_child_for(parent, code, name) 
  return nil if code.nil? or code.empty? or parent.nil? or code.start_with?("000")
  child = parent.children.detect{|c| c.code == code}
  if child.nil?
    child_level = parent.level + 1
    child_geocode = parent.geocode + code.rjust(2, '0')
    child = GeoLocation.new code, child_level, name, child_geocode
    parent.children.push child
  end
  child
end

files_for_states = { "KA" => "2011_29_karnataka_location.csv", "TN" => "2011_33_tamil_nadu_location.csv", "AP" => "2011_28_andhra_pradesh_location.csv" }
current_state = "AP"
state_specific_input_file = Dir.pwd.concat("/data/address/").concat(files_for_states[current_state])
state_specific_output_file = Dir.pwd.concat("/data/address_to_import/").concat(files_for_states[current_state]).chomp(".csv").concat("_out_coded.csv")



CSV.foreach state_specific_input_file, :headers => true do |row|
  state_code = row["MDDS STC"]
  state_name = row["STATE NAME"]
  district_code = row["MDDS DTC"]
  district_name = row["DISTRICT NAME"]
  sub_district_code = row["MDDS Sub_DT"]
  sub_district_name = row["SUB-DISTRICT NAME"]

  state       = find_or_create_state(state_code, state_name)
  district    = find_or_create_child_for(state, district_code, district_name)
  subdistrict    = find_or_create_child_for(district, sub_district_code, sub_district_name)
end

$address_heirarchies_file = File.open(state_specific_output_file, "w+")
@states.each{|s| s.export_address_entries("")}
$address_heirarchies_file.close


# $location_heirarchies_file = File.open("data/locationhierarchies.sql", "w+")
# $location_heirarchies_file.puts "INSERT INTO location_attribute_type (name, description, datatype, min_occurs, max_occurs, creator, date_created, uuid)  select 'LocationCode', 'MDDS Location code', 'org.openmrs.customdatatype.datatype.FreeTextDatatype', 0, 1, 1, curdate(), uuid() from dual where NOT EXISTS(select * from location_attribute_type where name ='LocationCode');"
# $location_heirarchies_file.puts "set @rootGeocode = 0;"
# $location_heirarchies_file.puts "select location_id into @rootGeocode from location where name = \"LocationCodes\";"
# @states.each{|s| s.export_location_hierarchies}
# $location_heirarchies_file.close