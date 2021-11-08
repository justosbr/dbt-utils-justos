{% macro except() %}
  {{ return(adapter.dispatch('except', 'dbt_utils_justos')()) }}
{% endmacro %}


{% macro default__except() %}

    except

{% endmacro %}
    
{% macro bigquery__except() %}

    except distinct

{% endmacro %}