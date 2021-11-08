{% macro pretty_time(format='%H:%M:%S') %}
    {{ return(adapter.dispatch('pretty_time', 'dbt_utils_justos')(format)) }}
{% endmacro %}

{% macro default__pretty_time(format='%H:%M:%S') %}
    {{ return(modules.datetime.datetime.now().strftime(format)) }}
{% endmacro %}
