with source_payments as (

    select * 
    from {{ source('stripe', 'payment') }}

),

final as (
    select 
        id as payment_id
        , orderid
        , paymentmethod
        , status 
        , amount 
        , created 
        , _batched_at
    from 
        source_payments
)

select * from final
