{% macro length(expression) -%}
    {{ return(adapter.dispatch('length', 'dbt_utils_justos') (expression)) }}
{% endmacro %}


{% macro default__length(expression) %}
    
    length(
        {{ expression }}
    )
    
{%- endmacro -%}


{% macro redshift__length(expression) %}

    len(
        {{ expression }}
    )
    
{%- endmacro -%}