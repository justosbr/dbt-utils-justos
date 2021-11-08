

{% macro concat(fields) -%}
  {{ return(adapter.dispatch('concat', 'dbt_utils_justos')(fields)) }}
{%- endmacro %}

{% macro default__concat(fields) -%}
    {{ fields|join(' || ') }}
{%- endmacro %}
