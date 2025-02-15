/* query ejercicio 8 practica*/
/*En este caso opto por emplear un IF para simplificar el codigo ,tambien podriamos usar CASE WHEN.Podriamos emplear tambien COUNT(DISTINCT IF... en vez de MAX.Ordeno en descendiente solo a efectos de comprobar en la visualizacion */
select 
    ivr_modules.ivr_id,
    max(if(ivr_modules.module_name = 'averia_masiva', 1, 0)) as masiva_lg
from keepcoding.ivr_modules
group by ivr_modules.ivr_id
order by masiva_lg desc;