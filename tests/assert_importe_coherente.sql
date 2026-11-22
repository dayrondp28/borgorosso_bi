-- Falla si algún importe no es cantidad x precio, o si el precio difiere de la carta
select f.id_pedido, f.importe
from {{ ref('Fact_Pedidos') }} f
join {{ ref('Dim_Producto') }} d on d.id_producto = f.id_producto
where f.importe <> f.cantidad * f.precio_unitario
   or f.precio_unitario <> d.precio_vigente
