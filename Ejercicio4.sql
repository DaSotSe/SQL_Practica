/* query ejercicio 4 practica */

select
   *,
  case
    when vdn_label like 'atc%' then 'front'
    when vdn_label like 'tech%' then 'tech'
    when vdn_label = 'absortion' then 'absortion'
    else 'resto'
  end as vdn_aggregation
from keepcoding.ivr_calls;



