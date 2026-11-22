-- El tiempo de atencion no puede ser negativo (entrega antes del pedido)
select id_pedido, tiempo_atencion_min
from {{ ref('slv_pedidos') }}
where tiempo_atencion_min < 0
