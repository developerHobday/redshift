with source as (
    select * from {{ source('public', 'category') }}
)

select * from source
