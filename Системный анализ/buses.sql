-- Напишите запрос к базе Общественный транспорт и определите, 
-- сколько остановок в прямом направлении есть на 191 маршруте (вид транспорта — АВТОБУС)?
-- 1	"ПРЯМОЕ"	"DIRECT"
-- 0	"АВТОБУС"	"BUS"

-- SELECT count(distinct(id_stop))
-- FROM route_by_stops
-- Where id_direction = 1
-- and route_number = 191
-- and id_vehicle = 0
-- --37
-- Напишите запрос к базе Общественный транспорт и определите, 
-- сколько остановок в обратном направлении есть на 1 маршруте (вид транспорта — АВТОБУС)?
-- SELECT count(*)
-- FROM route_by_stops
-- Where id_direction = 2
-- and route_number = 1
-- and id_vehicle = 0
-- Напишите запрос к базе Общественный транспорт и определите, 
-- по какому маршруту ездил АВТОБУС с бортовым номером 194126?

-- select distinct(route_number) from track
-- where CARRIER_BOARD_NUM = 194126

-- Напишите запрос к базе Общественный транспорт и определите, сколько единиц общественного транспорта 
-- (с различными бортовыми номерами) работали на 191 маршруте (вид транспорта — АВТОБУС)?
-- select count(distinct(CARRIER_BOARD_NUM)) from track
-- where route_number = 191
-- and id_vehicle = 0

-- Напишите запрос к базе Общественный транспорт и определите, 
-- какое максимальное расстояние между соседними остановками на маршруте АВТОБУСА номер 10?

-- SELECT max(distance_back)
-- FROM route_by_stops
-- where route_number = 10
-- and id_vehicle = 0

-- Напишите запрос к базе Общественный транспорт и определите, 
-- какому виду транспорта соответствует маршрут 10?

-- SELECT distinct(id_vehicle)
-- FROM route_by_stops
-- where route_number = 10

-- select * from vehicle

-- Напишите запрос к базе Общественный транспорт и определите долготу и широту 
-- 12-й остановки на ПРЯМОМ направлении маршрута АВТОБУСА номер 14

-- select * from stops as st
-- join route_by_stops as rs
-- on st.ID_STOP = rs.ID_STOP
-- where ROUTE_NUMBER = 14
-- and id_direction = 1
-- and id_vehicle = 0
-- and rs.STOP_NUMBER= 12

-- Напишите запрос к базе Общественный транспорт и определите НОМЕРА АВТОБУСНЫХ маршрутов, 
-- длина которых в ПРЯМОМ направлении попадает в интервал [11750, 18500]

-- select ROUTE_NUMBER from route_by_stops
-- where id_vehicle = 0
-- and id_direction = 1
-- group by ROUTE_NUMBER
-- having sum(DISTANCE_BACK) between 11750 and 18500

-- В базе Общественный транспорт есть таблица STOPS, в которой содержаться сведения об остановках. 
-- Определите количество остановок, в названиях которых встречается подстрока ДВОРЕЦ. 
-- При поиске остановки в точности соблюдайте заданный регистр.

-- select * from STOPS
-- where stop_name like '%ДВОРЕЦ%'

-- SELECT GetNumber (5, 6)

-- SELECT COUNT(*) AS Num_Stops
-- FROM STOPS
-- WHERE CoordinateDistance(59.9363823, 30.3022308, LATITUDE, LONGITUDE) <= 450;

SELECT COUNT(*) AS Num_Buses
FROM TRACK
WHERE ID_STOP = 2875
  AND STOP_TIME_REAL >= '2019-09-09 16:00:00'
  AND STOP_TIME_REAL < '2019-09-09 17:00:00'
  AND ROUTE_NUMBER = 6
  AND ID_VEHICLE = 0




