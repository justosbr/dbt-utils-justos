{% macro my_custom_macro() %}
    whatever
{% endmacro %}

{% macro limit_zero() %}
    {{ return(adapter.dispatch('limit_zero', 'dbt_utils_justos')()) }}
{% endmacro %}

{% macro default__limit_zero() %}
    {{ return('limit 0') }}
{% endmacro %}