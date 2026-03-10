{% macro handle_nulls_macros(column_name, default_value)%}

COALESCE{{(column_name),(default_value)}}

{% endmacro  %}

