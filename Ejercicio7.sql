/* query ejercicio 7 practica*/
/* exlcuyo los clientes que tengan billing_account como unknow*/

select 
    ivr_calls.ivr_id,
    ivr_calls.phone_number,
    ivr_calls.ivr_result,
    ivr_calls.vdn_label,
    max(ivr_steps.billing_account_id) as billing_account_id  
from keepcoding.ivr_calls
inner
join keepcoding.ivr_steps
on ivr_calls.ivr_id = ivr_steps.ivr_id
where ivr_steps.billing_account_id not in ('unknown')
group by ivr_calls.ivr_id, ivr_calls.phone_number, ivr_calls.ivr_result, ivr_calls.vdn_label;