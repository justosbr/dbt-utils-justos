{% macro pretty_log_format(message) %}
    {{ return(adapter.dispatch('pretty_log_format', 'dbt_utils_justos')(message)) }}
{% endmacro %}

{% macro default__pretty_log_format(message) %}
    {{ return( dbt_utils_justos.pretty_time() ~ ' + ' ~ message) }}
{% endmacro %}
