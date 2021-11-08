
{%- macro string_literal(value) -%}
  {{ return(adapter.dispatch('string_literal', 'dbt_utils_justos') (value)) }}
{%- endmacro -%}

{% macro default__string_literal(value) -%}
    '{{ value }}'
{%- endmacro %}
