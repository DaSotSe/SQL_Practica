/* query ejercicio 5 practica*/
/* Opto por retirar en base a la interpretacion que hago de enunciado, no hay datos en la columna document_type porlo que no puedo edificarlos por este campo.Cabria la posibilidad de poder identificarlos por la columna phone_number entendiendose que son valores en relacion uno a uno con el cliente*/
select 
    ivr_calls.ivr_id,
    ivr_calls.phone_number,
    ivr_calls.ivr_result,
    ivr_calls.vdn_label,
    max(ivr_steps.document_type) as document_type,  
    max(ivr_steps.document_identification) as document_identification  
from keepcoding.ivr_calls
inner
join keepcoding.ivr_steps
on ivr_calls.ivr_id = ivr_steps.ivr_id
where ivr_steps.document_type not in ('unknown', 'desconocido')
group by ivr_calls.ivr_id, ivr_calls.phone_number, ivr_calls.ivr_result, ivr_calls.vdn_label;