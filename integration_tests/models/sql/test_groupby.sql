with test_data as (
    
    select
    
        {{ dbt_utils_justos.safe_cast("'a'", dbt_utils_justos.type_string() )}} as column_1,
        {{ dbt_utils_justos.safe_cast("'b'", dbt_utils_justos.type_string() )}} as column_2
    
),

grouped as (

    select 
        *,
        count(*) as total

    from test_data
    {{ dbt_utils_justos.group_by(2) }}
    
)

select * from grouped



