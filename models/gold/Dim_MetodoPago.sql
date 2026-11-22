-- GOLD: dimensión de métodos de pago
select row_number() over (order by metodo_pago) as id_metodo_pago, metodo_pago
from (select distinct metodo_pago from {{ ref('slv_pedidos') }})
