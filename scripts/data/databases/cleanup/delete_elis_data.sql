truncate table result_signature,
	referral_result,
	referral,
	result_inventory,
	result,
	worksheet_analyte,
	note,
	report_external_export,
	report_external_import,
	analysis_qaevent,
	analysis_storages,
	analysis_users,
	analysis,
	sample_qaevent,
	sample_requester,
	sample_human,
	sample_newborn,
	sample_animal,
	sample_environmental,
	sample_item,
	sample_organization,
	sample_projects,
	sample,
	observation_history,
	patient,
	patient_identity,
	patient_occupation,
	person_address,
	patient_patient_type,
	patient_relations,
	organization_contact;

delete from person where not exists (select p.person_id from provider p where p.person_id = person.id);
delete from markers where feed_uri like '%atomfeed/encounter/recent%' OR feed_uri like '%atomfeed/patient/recent%';
delete from event_records where category = 'patient';

truncate table event_records_offset_marker;