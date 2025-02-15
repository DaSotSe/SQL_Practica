/* query ejercicio 11 practica*/

select 
    ic.ivr_id,
    ic.phone_number,
    ic.start_date,
    case 
        when exists (
            select 1 
            from keepcoding.ivr_calls ic2
            where ic.phone_number = ic2.phone_number  
            and ic.ivr_id != ic2.ivr_id  
            and ic2.start_date between timestamp_sub(ic.start_date, interval 24 hour) 
                                  and ic.start_date
            and ic2.start_date < ic.start_date
        ) then 1  
        else 0
    end as repeated_phone_24h,

    case 
        when exists (
            select 1 
            from keepcoding.ivr_calls ic2
            where ic.phone_number = ic2.phone_number  
            and ic.ivr_id != ic2.ivr_id  
            and ic2.start_date between ic.start_date and timestamp_add(ic.start_date, interval 24 hour)
        ) then 1
        else 0
    end as cause_recall_phone_24h
from keepcoding.ivr_calls ic;

