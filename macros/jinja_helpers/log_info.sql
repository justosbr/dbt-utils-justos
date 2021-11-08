{% macro log_info(message) %}
    {{ return(adapter.dispatch('log_info', 'dbt_utils_justos')(message)) }}
{% endmacro %}

{% macro default__log_info(message) %}
    {{ log(dbt_utils_justos.pretty_log_format(message), info=True) }}
{% endmacro %}
