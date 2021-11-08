
-- how can we test this better?
select
    {{ dbt_utils_justos.current_timestamp_in_utc() }} as actual,
    {{ dbt_utils_justos.current_timestamp_in_utc() }} as expected