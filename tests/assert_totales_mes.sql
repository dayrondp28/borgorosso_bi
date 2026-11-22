-- Valores de referencia calculados de forma independiente (pandas) sobre el Excel original.
-- La prueba falla (devuelve filas) si algún total de la capa gold no coincide.
with t as (
    select
        sum(importe)                       as ventas,
        count(distinct id_pedido)          as pedidos,
        sum(cantidad)                      as unidades
    from {{ ref('Fact_Pedidos') }}
)
select * from t
where ventas <> 49624 or pedidos <> 761 or unidades <> 2541
