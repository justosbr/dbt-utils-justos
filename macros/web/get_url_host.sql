{% macro get_url_host(field) -%}
    {{ return(adapter.dispatch('get_url_host', 'dbt_utils_justos')(field)) }}
{% endmacro %}

{% macro default__get_url_host(field) -%}

{%- set parsed = 
    dbt_utils_justos.split_part(
        dbt_utils_justos.split_part(
            dbt_utils_justos.replace(
                dbt_utils_justos.replace(field, "'http://'", "''"
                ), "'https://'", "''"
            ), "'/'", 1
        ), "'?'", 1
    )
    
-%}

     
    {{ dbt_utils_justos.safe_cast(
        parsed,
        dbt_utils_justos.type_string()
        )}}
        

{%- endmacro %}