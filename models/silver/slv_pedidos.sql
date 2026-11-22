-- SILVER: limpieza y tipado de los pedidos crudos (una fila por producto de cada pedido)
with src as (
    select * from {{ ref('raw_pedidos') }}
),
limpio as (
    select
        cast(trim(id_pedido) as int)                              as id_pedido,
        to_date(trim(fecha), 'yyyy-MM-dd')                        as fecha,
        to_timestamp(concat(trim(fecha), ' ', trim(hora_pedido))) as ts_pedido,
        case when nullif(trim(hora_entrega), '') is null then null
             else to_timestamp(concat(trim(fecha), ' ', trim(hora_entrega))) end as ts_entrega,
        trim(canal)                                               as canal,
        trim(producto)                                            as producto,
        trim(categoria)                                           as categoria,
        cast(trim(cantidad) as int)                               as cantidad,
        cast(trim(precio_unitario) as decimal(10,2))              as precio_unitario,
        trim(metodo_pago)                                         as metodo_pago,
        (trim(tiene_error) = 'Sí')                                as con_error
    from src
)
select
    *,
    cantidad * precio_unitario as importe,
    hour(ts_pedido)            as hora,
    case when ts_entrega is null then null
         else round((unix_timestamp(ts_entrega) - unix_timestamp(ts_pedido)) / 60.0, 2) end as tiempo_atencion_min
from limpio
