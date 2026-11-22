-- GOLD: dimensión de productos
select
    row_number() over (order by categoria, producto) as id_producto,
    producto,
    categoria,
    precio_vigente
from {{ ref('slv_carta') }}
