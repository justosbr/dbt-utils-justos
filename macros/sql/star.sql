{% macro star(from, relation_alias=False, except=[]) -%}
    {{ return(adapter.dispatch('star', 'dbt_utils_justos')(from, relation_alias, except)) }}
{% endmacro %}

{% macro default__star(from, relation_alias=False, except=[]) -%}
    {%- do dbt_utils_justos._is_relation(from, 'star') -%}
    {%- do dbt_utils_justos._is_ephemeral(from, 'star') -%}

    {#-- Prevent querying of db in parsing mode. This works because this macro does not create any new refs. #}
    {%- if not execute -%}
        {{ return('') }}
    {% endif %}

    {%- set include_cols = [] %}
    {%- set cols = adapter.get_columns_in_relation(from) -%}
    {%- set except = except | map("lower") | list %}
    {%- for col in cols -%}

        {%- if col.column|lower not in except -%}
            {% do include_cols.append(col.column) %}

        {%- endif %}
    {%- endfor %}

    {%- for col in include_cols %}

        {%- if relation_alias %}{{ relation_alias }}.{% else %}{%- endif -%}{{ adapter.quote(col)|trim }}
        {%- if not loop.last %},{{ '\n  ' }}{% endif %}

    {%- endfor -%}
{%- endmacro %}
