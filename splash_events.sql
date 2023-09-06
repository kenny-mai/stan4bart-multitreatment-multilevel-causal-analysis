with student as (
select
	distinct id,
	best_ever_cy_assignment__c,
	best_ever_cy_assignment_status__c,
	best_ever_cy_assignment_rank__c,
	best_cy_assignment_status__c,
	free_uniform_order_date__c,
	students_home__latitude__s,
	students_home__longitude__s,
	address__c,
	city__c,
	zip_code__c,
	individual__c,
	has_uniform_on_order__c,
	gender__c,
	is_english_language_learner__c,
	is_homeless__c
from
	--select * from sacs_salesforce.school_application_mirror.prod_student__c psc -- Don't have access to the prod student table; below is the DDL to create it; hack
			(
	select
		derived_table1.num,
		derived_table1.active__c,
		derived_table1.address__c,
		derived_table1.apt__c,
		derived_table1.archived__c,
		derived_table1.attendance_count__c,
		derived_table1.attended__c,
		derived_table1.best_cy_assignment_rank__c,
		derived_table1.best_cy_assignment_status__c,
		derived_table1.best_cy_assignment__c,
		derived_table1.best_ever_cy_assignment_rank__c,
		derived_table1.best_ever_cy_assignment_status__c,
		derived_table1.best_ever_cy_assignment__c,
		derived_table1.best_ever_fy_assignment_rank__c,
		derived_table1.best_ever_fy_assignment_status__c,
		derived_table1.best_ever_fy_assignment__c,
		derived_table1.best_ever_placement_assignment_rank__c,
		derived_table1.best_ever_placement_assignment_status__c,
		derived_table1.best_ever_placement_assignment__c,
		derived_table1.best_fy_assignment_rank__c,
		derived_table1.best_fy_assignment_status__c,
		derived_table1.best_fy_assignment__c,
		derived_table1.best_placement_assignment_rank__c,
		derived_table1.best_placement_assignment_status__c,
		derived_table1.best_placement_assignment__c,
		derived_table1.city__c,
		derived_table1.createdbyid,
		derived_table1.createddate,
		derived_table1.current_grade__c,
		derived_table1.current_grade_capacity__c,
		derived_table1.current_program__c,
		derived_table1.current_sis_school__c,
		derived_table1.date_of_birth__c,
		derived_table1.district__c,
		derived_table1.does_sharing_need_run__c,
		derived_table1.email__c,
		derived_table1.exclude_from_placement__c,
		derived_table1.family_profile_address_has_changed__c,
		derived_table1.first_day_of_school__c,
		derived_table1.firstnamestripped__c,
		derived_table1.future_grade_capacity__c,
		derived_table1.future_program__c,
		derived_table1.future_school__c,
		derived_table1.future_school_grade__c,
		derived_table1.future_sis_grade__c,
		derived_table1.gender__c,
		derived_table1.gmaps_api_down__c,
		derived_table1.has_uniform_on_order__c,
		derived_table1.has_valid_address__c,
		derived_table1.how_did_you_hear_about_us__c,
		derived_table1.id,
		derived_table1.individual__c,
		derived_table1.interest_in_summer_school__c,
		derived_table1.is_english_language_learner__c,
		derived_table1.is_homeless__c,
		derived_table1.is_legal_guardian__c,
		derived_table1.is_processing_wsr_offer__c,
		derived_table1.isdeleted,
		derived_table1.lastactivitydate,
		derived_table1.lastmodifiedbyid,
		derived_table1.lastmodifieddate,
		derived_table1.lastnamestripped__c,
		derived_table1.lastreferenceddate,
		derived_table1.lastvieweddate,
		derived_table1.legal_guardian_email__c,
		derived_table1.legal_guardian_name__c,
		derived_table1.legal_guardian_phone__c,
		derived_table1.migrated_student__c,
		derived_table1.name,
		derived_table1.non_district_current_school_organization__c,
		derived_table1.opted_out_of_usps_validation__c,
		derived_table1.other_non_district_current_school_org__c,
		derived_table1.ownerid,
		derived_table1.primary_contact_number__c,
		derived_table1.projected_program__c,
		derived_table1.projected_school__c,
		derived_table1.published_offer_sent__c,
		derived_table1.ref_parent_guardian_first_name__c,
		derived_table1.ref_parent_guardian_last_name__c,
		derived_table1.registered__c,
		derived_table1.registration_birth_certificate__c,
		derived_table1.registration_completion_status__c,
		derived_table1.registration_display_of_scholar_work__c,
		derived_table1.registration_emergency_contacts__c,
		derived_table1.registration_ethnic_id__c,
		derived_table1.registration_field_studies__c,
		derived_table1.registration_frpl_status__c,
		derived_table1.registration_health_questionnaire__c,
		derived_table1.registration_home_language_questionnaire__c,
		derived_table1.registration_housing_status__c,
		derived_table1.registration_immunization__c,
		derived_table1.registration_media_release__c,
		derived_table1.registration_medical_admin_form__c,
		derived_table1.registration_parent_contract__c,
		derived_table1.registration_physical__c,
		derived_table1.registration_priority_contacts__c,
		derived_table1.registration_proof_of_residency__c,
		derived_table1.relationship_to_child__c,
		derived_table1.returning_status__c,
		derived_table1.school__c,
		derived_table1.school_year__c,
		derived_table1.secondary_contact_number__c,
		derived_table1.state__c,
		derived_table1.student_first_name__c,
		derived_table1.student_id__c,
		derived_table1.student_last_name__c,
		derived_table1.student_type__c,
		derived_table1.students_home__latitude__s,
		derived_table1.students_home__longitude__s,
		derived_table1.survey_parent_first_name__c,
		derived_table1.survey_parent_last_name__c,
		derived_table1.survey_representative_first_name__c,
		derived_table1.survey_representative_last_name__c,
		derived_table1.systemmodstamp,
		derived_table1.transfer_request__c,
		derived_table1.usps_address_not_found__c,
		derived_table1.usps_api_down__c,
		derived_table1.uuid__c,
		derived_table1.zip_code__c,
		derived_table1.current_sis_grade__c,
		derived_table1.free_uniform_order_date__c
	from
		(
		select
			pg_catalog.row_number()
				          over( 
				          partition by student__c.id
		order by
			student__c.systemmodstamp desc) as num,
			student__c.active__c,
			student__c.address__c,
			student__c.apt__c,
			student__c.archived__c,
			student__c.attendance_count__c,
			student__c.attended__c,
			student__c.best_cy_assignment_rank__c,
			student__c.best_cy_assignment_status__c,
			student__c.best_cy_assignment__c,
			student__c.best_ever_cy_assignment_rank__c,
			student__c.best_ever_cy_assignment_status__c,
			student__c.best_ever_cy_assignment__c,
			student__c.best_ever_fy_assignment_rank__c,
			student__c.best_ever_fy_assignment_status__c,
			student__c.best_ever_fy_assignment__c,
			student__c.best_ever_placement_assignment_rank__c,
			student__c.best_ever_placement_assignment_status__c,
			student__c.best_ever_placement_assignment__c,
			student__c.best_fy_assignment_rank__c,
			student__c.best_fy_assignment_status__c,
			student__c.best_fy_assignment__c,
			student__c.best_placement_assignment_rank__c,
			student__c.best_placement_assignment_status__c,
			student__c.best_placement_assignment__c,
			student__c.city__c,
			student__c.createdbyid,
			student__c.createddate,
			student__c.current_grade__c,
			student__c.current_grade_capacity__c,
			student__c.current_program__c,
			student__c.current_sis_school__c,
			student__c.date_of_birth__c,
			student__c.district__c,
			student__c.does_sharing_need_run__c,
			student__c.email__c,
			student__c.exclude_from_placement__c,
			student__c.family_profile_address_has_changed__c,
			student__c.first_day_of_school__c,
			student__c.firstnamestripped__c,
			student__c.future_grade_capacity__c,
			student__c.future_program__c,
			student__c.future_school__c,
			student__c.future_school_grade__c,
			student__c.future_sis_grade__c,
			student__c.gender__c,
			student__c.gmaps_api_down__c,
			student__c.has_uniform_on_order__c,
			student__c.has_valid_address__c,
			student__c.how_did_you_hear_about_us__c,
			student__c.id,
			student__c.individual__c,
			student__c.interest_in_summer_school__c,
			student__c.is_english_language_learner__c,
			student__c.is_homeless__c,
			student__c.is_legal_guardian__c,
			student__c.is_processing_wsr_offer__c,
			student__c.isdeleted,
			student__c.lastactivitydate,
			student__c.lastmodifiedbyid,
			student__c.lastmodifieddate,
			student__c.lastnamestripped__c,
			student__c.lastreferenceddate,
			student__c.lastvieweddate,
			student__c.legal_guardian_email__c,
			student__c.legal_guardian_name__c,
			student__c.legal_guardian_phone__c,
			student__c.migrated_student__c,
			student__c.name,
			student__c.non_district_current_school_organization__c,
			student__c.opted_out_of_usps_validation__c,
			student__c.other_non_district_current_school_org__c,
			student__c.ownerid,
			student__c.primary_contact_number__c,
			student__c.projected_program__c,
			student__c.projected_school__c,
			student__c.published_offer_sent__c,
			student__c.ref_parent_guardian_first_name__c,
			student__c.ref_parent_guardian_last_name__c,
			student__c.registered__c,
			student__c.registration_birth_certificate__c,
			student__c.registration_completion_status__c,
			student__c.registration_display_of_scholar_work__c,
			student__c.registration_emergency_contacts__c,
			student__c.registration_ethnic_id__c,
			student__c.registration_field_studies__c,
			student__c.registration_frpl_status__c,
			student__c.registration_health_questionnaire__c,
			student__c.registration_home_language_questionnaire__c,
			student__c.registration_housing_status__c,
			student__c.registration_immunization__c,
			student__c.registration_media_release__c,
			student__c.registration_medical_admin_form__c,
			student__c.registration_parent_contract__c,
			student__c.registration_physical__c,
			student__c.registration_priority_contacts__c,
			student__c.registration_proof_of_residency__c,
			student__c.relationship_to_child__c,
			student__c.returning_status__c,
			student__c.school__c,
			student__c.school_year__c,
			student__c.secondary_contact_number__c,
			student__c.state__c,
			student__c.student_first_name__c,
			student__c.student_id__c,
			student__c.student_last_name__c,
			student__c.student_type__c,
			student__c.students_home__latitude__s,
			student__c.students_home__longitude__s,
			student__c.survey_parent_first_name__c,
			student__c.survey_parent_last_name__c,
			student__c.survey_representative_first_name__c,
			student__c.survey_representative_last_name__c,
			student__c.systemmodstamp,
			student__c.transfer_request__c,
			student__c.usps_address_not_found__c,
			student__c.usps_api_down__c,
			student__c.uuid__c,
			student__c.zip_code__c,
			student__c.current_sis_grade__c,
			student__c.free_uniform_order_date__c
		from
			sacs_salesforce.school_application_mirror.student__c) derived_table1
	where
		derived_table1.num = 1
		and derived_table1.isdeleted = false)
where
	best_ever_cy_assignment_status__c = 'Accepted'
),
application as (
select
	id,
	name,
	createddate,
	status__c,
	student__c,
	current_grade__c as grade_applying_for__c,
	eligibility_decision__c,
	ineligibility_reason__c,
	recordtypeid,
	parent_contact__c
from
	sacs_salesforce.school_application_mirror.prod_application__c
where
	status__c = 'Submitted'
	and (ineligibility_reason__c is null
		or ineligibility_reason__c not in ('Age - Too Old', 'Test Application', 'Ineligible', 'Duplicate', 'Age - Too Young'))
		and recordtypeid != '0125f000000AoNiAAK'
),
sf_contact as (
select 
		distinct 
			id as student_id
			,
	org_specific_id__c as esd_id
			,
	lastname
from
	sacs_salesforce.school_application_mirror.prod_contact
where
	org_specific_id__c is not null
),
hed_application as (
select 
	distinct
		app_round_application__c
		,
	priority_group_verbiage__c
		,
	program_rank__c
from
	sacs_salesforce.school_application_mirror.prod_hed__application__c hed_application
),
best_offer as (
select 
	application.id as round_app_id,
	application.name as round_app_nam,
	account.name as best_offer_school,
	best_ever_cy_assignment_rank__c,
	grade_applying_for__c,
	student.students_home__latitude__s,
	student.students_home__longitude__s,
	address__c,
	city__c,
	zip_code__c,
	ispreregistered,
	dsoi.enrollment_status,
	esd_id,
	has_uniform_on_order__c,
	priority_group_verbiage__c,
	gender__c,
	is_english_language_learner__c,
	is_homeless__c,
	row_number() over (partition by application.name
order by
	application.name) as dupcnt_offer
from
	student
inner join application
	on
	student.id = application.student__c
inner join sacs_salesforce.school_application_mirror.prod_waitlist_school_ranking__c lottery
	on
	student.best_ever_cy_assignment__c = lottery.id
	and application.id = lottery.round_application__c
left join sacs_salesforce.school_application_mirror.prod_account account
	on
	account.id = lottery.account_school__c
left join sf_contact
	on
	student.individual__c = sf_contact.student_id
left join hed_application
	on
	application.id = hed_application.app_round_application__c
	and student.best_ever_cy_assignment_rank__c = hed_application.program_rank__c
left join sacs.dim_scholar ds 
	on
	sf_contact.esd_id = ds.ioa_student_id
left join sacs.dim_scholar_other_info dsoi 
	on
	ds.dwh_scholar_id = dsoi.dwh_scholar_id
where
	grade_applying_for__c in ('K', '1', '2', '3', '4', '5', '6')
),
best_offer_dedupe as (
select
	*
from
	best_offer
where
	dupcnt_offer = 1
),
data_science_prod_splash_tours as(
select
	SUBSTRING(prod_splash_tours.salesforce_id::VARCHAR,
	"POSITION"(prod_splash_tours.salesforce_id::VARCHAR,
	':'::VARCHAR) + 1,
	50) as parent_id,
	case
		when lower(prod_splash_tours.event_type::VARCHAR) ilike '%webinars'::VARCHAR then 'Virtual Event'::VARCHAR
		else 'In-Person Event'::VARCHAR
	end as event_type_bucket,
	prod_splash_tours.event_name,
	MAX(case
                            when prod_splash_tours.status::VARCHAR = 'rsvp_yes'::VARCHAR 
                            	or prod_splash_tours.status::VARCHAR = 'checkin_yes'::VARCHAR 
                            	or prod_splash_tours.status::VARCHAR = 'checkin_no'::VARCHAR 
                            then 1 else 0 end) as rsvp,
	MAX(case
                        when prod_splash_tours.status::VARCHAR = 'checkin_yes'::VARCHAR 
                        	and event_name = 'Success Academy Orientation' 
                        	and event_type = 'Prospective Family In-Person Events'
                        then 1
                            else 0
                        end) as orientation_checkin,
	MIN(case
		when prod_splash_tours.status::VARCHAR = 'checkin_yes'::VARCHAR
			and event_name = 'Success Academy Orientation'
			and event_type = 'Prospective Family In-Person Events'
    		then prod_splash_tours.checked_in
			else null
		end) as orientation_check_in_time,
	MAX(
                        case
                            when prod_splash_tours.status::VARCHAR = 'rsvp_yes'::VARCHAR and event_name = 'Success Academy Orientation' and event_type = 'Prospective Family In-Person Events'
    						 then 1
                        		 else 0
                        end) as orientation_rsvp,
	MIN (case
		when prod_splash_tours.status::VARCHAR = 'rsvp_yes'::VARCHAR
			and event_name = 'Success Academy Orientation'
			and event_type = 'Prospective Family In-Person Events'
    						 then substring(date_rsvped,
			1,
			10)
			else null
		end) as orientation_rsvp_date,
	MAX(case
                            when prod_splash_tours.status::VARCHAR = 'checkin_yes'::VARCHAR or prod_splash_tours.status::VARCHAR = 'checkin_no'::VARCHAR then 1
                            else 0
                        end) as attended
from
	prod_data_science.prod_splash_tours prod_splash_tours
where
	not event_name like '%Fitting%'
group by
	1,
	2,
	3
),
splash_tours_grouped as (
select
	parent_id,
	event_name,
	case 
		when event_name like '%Eva%' then 'Event with Eva'
		when event_type_bucket = 'Virtual Event' then 'Virtual Event'
		when event_name like '%Open House%' then 'Open House/Tour'
		when event_name like 'SA%' then 'Open House/Tour'
		when event_name = 'Bronx 1' then 'Open House/Tour'
		when event_name like 'Success Academy%' then 'New Family Day'
		when event_name like '%Ambassador%' then 'Virtual Event'
		when event_name like '%New Family%' then 'New Family Day'
		when event_name like '%Summer%' then 'Summer Intensive'
		when event_name like 'Zoom%' then 'Virtual Event'
		when event_name like 'Webinar%' then 'Virtual Event'
		else 'In-Person Event'
	end as event,
	case
		when event_name like '%Eva%' then 'Virtual Event'
		when event_name like '%Ambassador%' then 'Virtual Event'
		when event_name like 'Zoom%' then 'Virtual Event'
		when event_name like 'Webinar%' then 'Virtual Event'
		else event_type_bucket
	end as event_type_bucket,
	rsvp,
	orientation_checkin,
	orientation_check_in_time,
	orientation_rsvp,
	orientation_rsvp_date,
	case
		when event_type_bucket = 'Virtual Event' then 1
		else attended
	end as attended
from
	data_science_prod_splash_tours
where
	not event_name like '%anceled%'
	and not event_name like '%CANCELLED%'
	and not event_name like '%Orientation%'
	and not event_name like '%Intens%'
),
salesforce_prod_application as (
select
	id,
	name,
	createddate,
	status__c,
	student__c,
	current_grade__c as grade_applying_for__c,
	eligibility_decision__c,
	ineligibility_reason__c,
	recordtypeid,
	parent_contact__c
from
	sacs_salesforce.school_application_mirror.prod_application__c pac
where
	status__c = 'Submitted'
	and (ineligibility_reason__c is null
		or ineligibility_reason__c not in ('Age - Too Old', 'Test Application', 'Ineligible', 'Duplicate', 'Age - Too Young'))
		and recordtypeid != '0125f000000AoNiAAK'
),
total_events as (
select
	*
from
	splash_tours_grouped
inner join salesforce_prod_application
on
	splash_tours_grouped.parent_id = salesforce_prod_application.parent_contact__c
where
	attended = 1
),
total_events_collapsed as (
select 
		*,
		row_number() over (partition by name,
	event
order by
	event) as dupcnt_events
from
	total_events
),
total_events_dedupe as (
select
	*
from
	total_events_collapsed
where
	dupcnt_events = 1
),
final_offers as (
select 
	*,
	case
		when ispreregistered = 'No'
			and enrollment_status = 'active' then 1
			else 0
		end as num_yield_and_still_here
	from
		best_offer_dedupe
),
final as (
select 
	round_app_nam as application_id,
	num_yield_and_still_here as yielded,
	case 
		when priority_group_verbiage__c = 'Sibling Attending Co-Located School' then 'Sibling Attending Same or Co-Located School' 
		when priority_group_verbiage__c = 'Sibling Attending Same School' then 'Sibling Attending Same or Co-Located School' 
		else priority_group_verbiage__c
	end as priority_group,
	best_offer_school as school_applied,
	case 
		when final_offers.grade_applying_for__c = 'K' then 1
		when final_offers.grade_applying_for__c = '1' then 1
		when final_offers.grade_applying_for__c = '2' then 1
		when final_offers.grade_applying_for__c = '3' then 1
		when final_offers.grade_applying_for__c = '4' then 1
		else 0
	end as in_es,
	case 
		when best_ever_cy_assignment_rank__c = 1 then 1
		else 0
	end as top_choice,
	case
		when gender__c = 'Female' then 1
		else 0
	end as gender_female,
	case
		when is_english_language_learner__c = 'Yes' then 1
		else 0
	end as ell_status,
	case
		when is_homeless__c = true then 1
		else 0
	end as homeless,
	max(case when event = 'Event with Eva' then 1 else 0 end) as eva_event,
	max(case when event = 'New Family Day' then 1 else 0 end) as new_family_day,
	max(case when event = 'Open House/Tour' then 1 else 0 end) as open_house_tour,
	max(case when event = 'Virtual Event' then 1 else 0 end) as virtual_event,
	max(case when event = 'In-Person Event' then 1 else 0 end) as in_person_event
from
	final_offers
left join total_events_dedupe
on
	final_offers.round_app_nam = total_events_dedupe.name
group by
	1,
	2,
	3,
	4,
	5,
	6,
	7,
	8,
	9
)
select * from final