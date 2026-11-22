-- GOLD: dimensión de canales de atención
select row_number() over (order by canal) as id_canal, canal
from (select distinct canal from {{ ref('slv_pedidos') }})
