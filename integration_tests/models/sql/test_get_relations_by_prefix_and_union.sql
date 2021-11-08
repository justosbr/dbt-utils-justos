{{ config(materialized = 'table') }}

{% set relations = dbt_utils_justos.get_relations_by_prefix(target.schema, 'data_events_') %}
{{ dbt_utils_justos.union_relations(relations) }}
