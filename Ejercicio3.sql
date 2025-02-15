/* query ejercicio 3 practica*/

create table keepcoding.ivr_detail as
select 
    c.ivr_id as ivr_id, 
    c.phone_number as phone_number, 
    c.ivr_result as ivr_result, 
    c.vdn_label as vdn_label,  
    format_date('%Y-%m-%d', c.start_date) as start_date_id,  
    format_date('%Y-%m-%d', c.end_date) as end_date_id,  
    c.total_duration as total_duration, 
    c.customer_segment as customer_segment, 
    c.ivr_language as ivr_language,
    c.steps_module as steps_module,
    c.module_aggregation as module_aggregation,

    m.module_sequece as module_sequence, 
    m.module_name as module_name, 
    m.module_duration as module_duration, 
    m.module_result as module_result,

    s.step_sequence as step_sequence, 
    s.step_name as step_name, 
    s.step_result as step_result, 
    s.step_description_error as step_description_error, 
    s.document_type as document_type, 
    s.document_identification as document_identification, 
    s.customer_phone as customer_phone, 
    s.billing_account_id as billing_account_id

from keepcoding.ivr_calls c
left
join keepcoding.ivr_modules m 
on c.ivr_id = m.ivr_id
left
join keepcoding.ivr_steps s 
on c.ivr_id = s.ivr_id;