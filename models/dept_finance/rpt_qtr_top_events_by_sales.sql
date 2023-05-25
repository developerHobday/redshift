with qtr_sales_by_event as (
    select * from {{ ref('rpt_finance_qtr_total_sales_by_event') }}
)

select 
    *,
    rank() over (partition by year, qtr order by revenue desc) as row_num
from qtr_sales_by_event