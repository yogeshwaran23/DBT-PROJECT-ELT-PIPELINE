{% macro string_stand_macro(column_name) %}

LOWER({{ column_name }})

{% endmacro %}
