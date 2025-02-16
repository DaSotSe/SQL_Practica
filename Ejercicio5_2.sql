/* query ejercicio 5 practica*/

select 
    ivr_calls.ivr_id,
    ivr_calls.phone_number,
    ivr_calls.ivr_result,
    ivr_calls.vdn_label,
    coalesce(
        max(case 
            when ivr_steps.document_type not in ('unknown', 'desconocido') 
            then ivr_steps.document_type 
        end), 
        ivr_calls.phone_number
    ) as document_type,
    coalesce(
        max(case 
            when ivr_steps.document_identification not in ('unknown', 'desconocido') 
            then ivr_steps.document_identification 
        end), 
        ivr_calls.phone_number
    ) as document_identification

from keepcoding.ivr_calls
left
join keepcoding.ivr_steps
on ivr_calls.ivr_id = ivr_steps.ivr_id
group by ivr_calls.ivr_id, ivr_calls.phone_number, ivr_calls.ivr_result, ivr_calls.vdn_label;