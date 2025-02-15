/* query ejercicio 6 practica*/

select 
    ivr_calls.ivr_id,
    ivr_calls.phone_number,
    ivr_calls.ivr_result,
    ivr_calls.vdn_label,
    max(ivr_steps.customer_phone) as customer_phone  
from keepcoding.ivr_calls
inner
join keepcoding.ivr_steps
on ivr_calls.ivr_id = ivr_steps.ivr_id
where ivr_steps.customer_phone not in ('unknown')
group by ivr_calls.ivr_id, ivr_calls.phone_number, ivr_calls.ivr_result, ivr_calls.vdn_label;