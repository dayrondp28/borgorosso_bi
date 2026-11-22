-- GOLD: dimensión de fechas (una fila por día con pedidos)
select
    fecha                                   as `Date`,
    year(fecha)                             as `Año`,
    month(fecha)                            as MesNum,
    case month(fecha)
        when 1 then 'Enero' when 2 then 'Febrero' when 3 then 'Marzo' when 4 then 'Abril'
        when 5 then 'Mayo' when 6 then 'Junio' when 7 then 'Julio' when 8 then 'Agosto'
        when 9 then 'Septiembre' when 10 then 'Octubre' when 11 then 'Noviembre'
        else 'Diciembre' end                as `Mes`,
    weekday(fecha) + 1                      as DiaSemanaNum,   -- 1 = lunes ... 7 = domingo
    case weekday(fecha)
        when 0 then 'Lunes' when 1 then 'Martes' when 2 then 'Miércoles'
        when 3 then 'Jueves' when 4 then 'Viernes' when 5 then 'Sábado'
        else 'Domingo' end                  as DiaSemana
from (select distinct fecha from {{ ref('slv_pedidos') }})
