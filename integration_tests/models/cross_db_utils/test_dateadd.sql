
with data as (

    select * from {{ ref('data_dateadd') }}

)

select
    case
        when datepart = 'hour' then cast({{ dbt_utils_justos.dateadd('hour', 'interval_length', 'from_time') }} as {{dbt_utils_justos.type_timestamp()}})
        when datepart = 'day' then cast({{ dbt_utils_justos.dateadd('day', 'interval_length', 'from_time') }} as {{dbt_utils_justos.type_timestamp()}})
        when datepart = 'month' then cast({{ dbt_utils_justos.dateadd('month', 'interval_length', 'from_time') }} as {{dbt_utils_justos.type_timestamp()}})
        when datepart = 'year' then cast({{ dbt_utils_justos.dateadd('year', 'interval_length', 'from_time') }} as {{dbt_utils_justos.type_timestamp()}})
        else null
    end as actual,
    result as expected

from data
