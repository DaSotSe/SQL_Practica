/* query ejercicio 10 practica*/
select 
    ivr_calls.ivr_id,
    ivr_calls.phone_number,
    ivr_calls.ivr_result,
    max(if(ivr_steps.step_name = 'customerinfobydni.tx' and ivr_steps.step_result = 'ok', 1, 0)) as info_by_dni_lg
from keepcoding.ivr_calls
inner
join keepcoding.ivr_steps
on ivr_calls.ivr_id = ivr_steps.ivr_id
group by ivr_calls.ivr_id, ivr_calls.phone_number, ivr_calls.ivr_result;



