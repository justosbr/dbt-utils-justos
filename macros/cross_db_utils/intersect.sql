{% macro intersect() %}
  {{ return(adapter.dispatch('intersect', 'dbt_utils_justos')()) }}
{% endmacro %}


{% macro default__intersect() %}

    intersect

{% endmacro %}

{% macro bigquery__intersect() %}

    intersect distinct

{% endmacro %}
