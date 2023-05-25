{# test sql #}
{% macro run_sql(col) %}

    {{ log('input:' ~ col) }}
    {% set sql %}
        select {{"'" ~ col ~ "'"}}, 'pricepaid'
        from public.sales
        limit 10
    {% endset %}
    {{ log('sql:' ~ sql, True) }}
    {% set results = run_query(sql) %}
    
    {% if execute %}
        {% for row in results.rows %}
            {{ log(row), True }}
        {% endfor %}
    {% else %}
        {{ log('not executed', True) }}
    {% endif %}
{% endmacro %}
