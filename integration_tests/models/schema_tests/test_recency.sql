
{% if target.type == 'postgres' %}

select
    {{ dbt_utils_justos.date_trunc('day', dbt_utils_justos.current_timestamp()) }} as today

{% else %}

select
    cast({{ dbt_utils_justos.date_trunc('day', dbt_utils_justos.current_timestamp()) }} as datetime) as today
    
{% endif %}
