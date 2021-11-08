{% macro get_url_path(field) -%}
    {{ return(adapter.dispatch('get_url_path', 'dbt_utils_justos')(field)) }}
{% endmacro %}

{% macro default__get_url_path(field) -%}

    {%- set stripped_url = 
        dbt_utils_justos.replace(
            dbt_utils_justos.replace(field, "'http://'", "''"), "'https://'", "''")
    -%}

    {%- set first_slash_pos -%}
        coalesce(
            nullif({{dbt_utils_justos.position("'/'", stripped_url)}}, 0),
            {{dbt_utils_justos.position("'?'", stripped_url)}} - 1
            )
    {%- endset -%}

    {%- set parsed_path =
        dbt_utils_justos.split_part(
            dbt_utils_justos.right(
                stripped_url, 
                dbt_utils_justos.length(stripped_url) ~ "-" ~ first_slash_pos
                ), 
            "'?'", 1
            )
    -%}

    {{ dbt_utils_justos.safe_cast(
        parsed_path,
        dbt_utils_justos.type_string()
    )}}
    
{%- endmacro %}
