with sales as (
    select * from {{ ref('base_public_sales') }}
),
events as (
    select * from {{ ref('base_public_event') }}
),
date as (
    select * from {{ ref('base_public_date') }}
)

select 
    d.year,
    d.qtr,
    s.eventid,
    count(s.salesid) sales,
    sum(s.pricepaid) revenue,
    sum(s.commission) comm,
    comm / revenue pct_comm
from 
    date d,
    events e, 
    sales s 
where 
    s.eventid = e.eventid 
    and e.dateid = d.dateid
group by 
    1,2,3
