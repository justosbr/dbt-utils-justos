
with data as (

    select * from {{ ref('data_safe_cast') }}

)

select
    {{ dbt_utils_justos.safe_cast('field', dbt_utils_justos.type_string()) }} as actual,
    output as expected

from data
