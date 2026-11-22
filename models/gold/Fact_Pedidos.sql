-- GOLD: tabla de hechos. Grano: una fila por producto dentro de un pedido
select
    p.id_pedido,
    p.fecha,
    p.ts_pedido                      as hora_pedido,
    p.ts_entrega                     as hora_entrega,
    p.hora,
    p.cantidad,
    p.precio_unitario,
    p.importe,
    p.tiempo_atencion_min,
    p.con_error,
    dp.id_producto,
    dc.id_canal,
    dm.id_metodo_pago
from {{ ref('slv_pedidos') }} p
join {{ ref('Dim_Producto') }}   dp on dp.producto    = p.producto
join {{ ref('Dim_Canal') }}      dc on dc.canal       = p.canal
join {{ ref('Dim_MetodoPago') }} dm on dm.metodo_pago = p.metodo_pago
