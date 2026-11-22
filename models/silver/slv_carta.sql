-- SILVER: carta de productos con tipos corregidos
select
    trim(producto)                        as producto,
    trim(categoria)                       as categoria,
    cast(precio_vigente as decimal(10,2)) as precio_vigente
from {{ ref('raw_carta') }}
