-- Задачи по курсу https://stepik.org/course/102883/syllabus

-- SELECT * from [Order Details]
-- select * from Products where ProductName not in ('Tofu','Konbu','Chang')

-- select *
-- from Products
-- where ProductName < 'Ikura'

-- select *
-- from Orders
-- where OrderDate < '1996-07-09 00:00:00.000'

-- select count(*)
-- from Products
-- where UnitPrice > 100

-- select * 
-- from Customers 
-- WHERE City like ('W%')

-- select * 
-- from Customers 
-- WHERE Phone like ('%5555%')

-- select count(*)
-- from Products
-- where UnitPrice > 100 or ProductName = 'Chai'

-- select *
-- from Orders
-- where OrderDate = '1998-02-26 00:00:00.000'
-- ORDER by EmployeeID, Freight DESC

-- select sum(UnitPrice)
-- from Products
-- WHERE CategoryID in (4,5)

-- select Country, count(*)
-- from Customers
-- group by Country
-- having count(*)>5
-- order by count(*) 

-- select City, COUNT(*)
-- from Customers
-- GROUP BY City
-- HAVING COUNT(*) > 4

-- select CategoryID, AVG(UnitPrice)
-- from Products
-- GROUP BY CategoryID
-- ORDER by AVG(UnitPrice) DESC

-- select OrderDate, COUNT(*)
-- from Orders
-- WHERE OrderDate BETWEEN '1998-03-01 00:00:00.000' and '1998-03-31 00:00:00.000' 
-- GROUP BY OrderDate
-- HAVING COUNT(*) = 4

-- select *
-- from Orders
-- WHERE OrderDate BETWEEN '1998-03-01 00:00:00.000' and '1998-03-31 00:00:00.000' 

-- SELECT OrderID, sum(Quantity * UnitPrice *( 1-Discount))
-- from [Order Details]
-- GROUP BY OrderID
-- HAVING sum(Quantity * UnitPrice *( 1-Discount)) > 10000

-- У какого количества клиентов в должности есть слово Sales, а регион не заполнен?

-- select *
-- from Customers
-- where ContactTitle like '%Sales%'
-- AND Region is NULL

-- Найдите самую популярную профессию среди клиентов.

-- select ContactTitle, COUNT(*)
-- from Customers
-- GROUP BY ContactTitle
-- ORDER by COUNT(*) Desc

-- select *
-- from Customers

-- Найдите заказ (OrderID) с самым большим количеством штук (Quantity) товаров в чеке. 
-- Если в заказе несколько разных товаров, то штуки нужно сложить. Какой OrderID у заказа?

-- select OrderID, Quantity
-- from Orders 
-- ORDER BY Quantity DESC

-- select OrderID, sum(Quantity)
-- from [Order Details]
-- GROUP by OrderID
-- ORDER by sum(Quantity) Desc

-- select *
-- from [Order Details]

-- Посчитайте суммарный размер фактической скидки по каждому заказу (не в процентах/не в долях). 
-- У скольких заказов скидка составила больше 3 000?

-- SELECT OrderID, sum(Quantity * UnitPrice *Discount)
-- from [Order Details]
-- GROUP BY OrderID
-- HAVING sum(Quantity * UnitPrice *Discount) > 3000

-- Посчитайте кол-во заказов, которые были оформлены сотрудником Andrew Fuller.

-- select count(*)
-- from Employees em
-- inner join Orders ord
-- on em.EmployeeID = ord.EmployeeID
-- where em.LastName = 'Fuller' and em.FirstName = 'Andrew'

-- Посчитайте суммарную выручку (стоимость) по заказам, 
-- которые были совершены в 1997 году. Ответ округлите до целого числа.

-- SELECT sum(Quantity * UnitPrice *( 1-Discount))
-- from [Order Details] ord 
-- join Orders ords 
-- on ord.OrderID = ords.OrderID
-- WHERE ords.OrderDate BETWEEN '1997-01-01 00:00:00.000' and '1997-12-31 00:00:00.000'

-- Выведите названия категорий и кол-во продуктов, 
-- которые входят в категории. Сопоставьте названия категорий и кол-во продуктов в категориях.

-- SELECT CategoryName, count(*)
-- from Products pr
-- join Categories ct 
-- on pr.CategoryID = ct.CategoryID
-- GROUP BY CategoryName

-- В каких городах проживают клиенты, которые не совершили ни одного заказа? 
-- SELECT * from Customers
-- SELECT * from Orders

-- Select *
-- from Customers cs 
-- left join Orders ord 
-- on cs.CustomerID = ord.CustomerID
-- where ord.OrderID is NULL

-- Выведите страны и кол-во клиентов, которые проживают в этих странах. Оставьте только страны 
-- с количеством клиентов более одного. 
-- Затем с помощью вложенного запроса посчитайте количество таких стран.

-- SELECT * from Customers

-- SELECT count(*)
-- from
-- (SELECT Country, COUNT(*) as cnt
-- from Customers cus
-- group by Country
-- HAVING COUNT(*) > 1) as t

-- Выведите ID клиентов и кол-во заказов, которые совершили клиенты. Оставьте только ID клиентов 
-- с количеством заказов более 10.
--  Затем с помощью вложенного запроса посчитайте количество оставшихся клиентов.

-- SELECT count(*)
-- from
-- (SELECT CustomerID, COUNT(*) as cnt
-- from Orders
-- GROUP BY CustomerID
-- HAVING COUNT(*) > 10
-- ) as tb1

-- Выведите товары, которые относятся к CategoryID =1. 
-- Используйте этот SQL-запрос как подзапрос для того, чтобы посчитать общую выручку по товарам, 
-- которые относятся к CategoryID = 1. Ответ округлите до целого числа.

-- SELECT round(sum(Quantity * UnitPrice *( 1-Discount)),2)
-- from [Order Details] ord 
-- join Orders ords 
-- on ord.OrderID = ords.OrderID
-- WHERE ord.ProductID in  (
--     SELECT ProductID from Products where CategoryID =1
-- )

-- Посчитайте количество заказов, в которых присутствует товар Chocolade.
-- SELECT count(*)
-- from [Order Details] ord 
-- join Products pr
-- on ord.ProductID = pr.ProductID
-- where ProductName = 'Chocolade'

-- Посчитайте общую выручку, которую принесли товары категории Confections. Ответ округлите до целого числа.
-- SELECT round(sum(Quantity * UnitPrice *( 1-Discount)),0)
-- from [Order Details] ord 
-- join Orders ords 
-- on ord.OrderID = ords.OrderID
-- WHERE ord.ProductID in  (
--     SELECT ProductID from Products pr
-- join Categories cat
-- on pr.CategoryID = cat.CategoryID
-- where CategoryName = 'Confections'
-- )

-- Выведите города доставки (Shipcity) и кол-во заказов, которые были оформлены в эти города в 1997 году. 
-- Оставьте только города с количеством заказов больше 5. 
-- Затем с помощью вложенного запроса посчитайте количество оставшихся городов.

-- select COUNT(*)
-- from
-- (select Shipcity, COUNT(orderid)  as c
-- from Orders
-- WHERE OrderDate BETWEEN '1997-01-01 00:00:00.000' and '1997-12-31 00:00:00.000'
-- group by Shipcity
-- HAVING COUNT(orderid) > 5) as tab

-- -- Revenue
-- select orderid, 
-- sum(UnitPrice*Quantity*(1-Discount)) as Revenue, 
-- case when sum(UnitPrice*Quantity*(1-Discount)) < 1000 then '0-999'
--          when sum(UnitPrice*Quantity*(1-Discount)) < 5000 then '1000-4999'
--          else '5000 and >' end as revenue_group
-- from [Order Details] 
-- group by orderid

-- select orderid, 
-- sum(UnitPrice*Quantity*(1-Discount)) as Revenue, 
-- case when sum(UnitPrice*Quantity*(1-Discount)) between 1 and 999 then '0-999'
--          when sum(UnitPrice*Quantity*(1-Discount)) between 1000 and 4999 then '1000-4999'
--          when sum(UnitPrice*Quantity*(1-Discount)) >=5000 then '5000 and >' end as revenue_group
-- from [Order Details] 
-- group by orderid

-- Выведите имена сотрудников, страны и регионы. 
--  помощью выражения CASE добавьте новый временный столбец Region и замените пустые значения NULL 
-- на значения 'not defined'. У скольких сотрудников регион не определен?

-- SELECT LastName,
-- CASE WHEN Region is NULL then 'not defined' end as Reg
-- FROM Employees

-- Выведите имена, фамилии сотрудников и обращения (TitleOfCourtesy). 
-- Далее с помощью выражения CASE добавьте временный столбец Gender. 
-- Если обращение Ms. или Mrs., то gender - 'women', а если обращение Mr. или Dr., то gender - 'men'. 
-- Затем с помощью вложенного запроса посчитайте кол-во мужчин и женщин. Сколько сотрудников женского пола?

-- SELECT * from Employees

-- select Gender, count(*)
-- from
-- (SELECT LastName, FirstName, TitleOfCourtesy,
-- CASE WHEN TitleOfCourtesy = 'Ms.' or  TitleOfCourtesy = 'Mrs.' then 'women'
--  WHEN TitleOfCourtesy = 'Mr.' or  TitleOfCourtesy = 'Dr.' then 'men' 
-- end as Gender
-- FROM Employees) as gen
-- GROUP BY Gender

-- Выведите наименования продуктов и их цену. Далее с помощью выражения CASE добавьте столбец с сегментацией по цене. 
-- Если цена от 0 до 9.99,  то это сегмент '0-9.99'. Если цена от 10 до 29.99, то это сегмент '10-29.99'. 
-- Если цена от 30 до 49.99, то это сегмент '30-49.99'. Если цена от 50, то это сегмент '50+'. 
-- Затем с помощью вложенного запроса посчитайте кол-во товаров в разрезе каждого сегмента. 
-- Сколько товаров в сегменте '50+'?

-- SELECT count(*)
-- from
-- (SELECT ProductName, UnitPrice,
-- CASE WHEN UnitPrice BETWEEN 0 and 9.99 then '0-9.99'
--  WHEN UnitPrice BETWEEN 10 and 29.99 then '10-29.99'
--  WHEN UnitPrice BETWEEN 30 and 49.99 then '30-49.99' 
-- WHEN UnitPrice > 50 then '50+'
--  end as categ
-- from Products) as categg
-- where categ = '50+'

-- select UnitPrice, --цена
--         SQRT(UnitPrice), --выводит корень из числа
--         SQUARE(UnitPrice) --возводит число в квадрат
-- from Products

-- Посчитайте общую выручку по всем заказам, которые были оформлены в 1996 году.
--  C помощью функции Round() округлите ответ до целого числа.

-- SELECT round(sum(Quantity * UnitPrice *( 1-Discount)),0)
-- from [Order Details] ord 
-- join Orders ords 
-- on ord.OrderID = ords.OrderID
-- WHERE OrderDate BETWEEN '1996-01-01 00:00:00.000' and '1996-12-31 00:00:00.000'

-- Посчитайте какое количество заказов было сделано в 1997 году по кварталам. 
-- Сколько заказов было сделано в четвертом квартале?

-- SELECT DATEPART(quarter, OrderDate), COUNT(OrderID)
-- from Orders
-- where OrderDate BETWEEN '1997-01-01' and '1997-12-31'
-- GROUP by DATEPART(quarter, OrderDate)

-- Какое количество названий стран клиентов состоят более чем из 10 символов?
-- SELECT DISTINCT Country,  LEN(Country)
-- from Customers
-- where LEN(Country) > 10

-- Посчитайте количество клиентов, у которых Французский язык является официальным. 
-- Это жители страны Франции или города Женевы, который находится в Швейцарии.

-- select COunt(*)
-- from Customers
-- where country = 'France' or City = 'Genève'

-- Сначала выведите имена всех жителей Испании. 
-- Затем добавьте по каждому жителю количество совершенных заказов. Сколько заказов совершил Diego Roel? 
-- select ContactName, count(orderid)
-- from Customers cs
-- left join Orders ord
-- on cs.customerid = ord.customerid
-- where cs.Country = 'Spain'
-- GROUP by ContactName

-- Посчитайте количество заказов, которые не были доставлены (столбец ShippedDate не заполнен)?
-- SELECT count(*)
-- from Orders
-- WHERE ShippedDate is NULL

-- C помощью LIKE найдите клиентов с именами, которые начинаются на Mari. Сколько их?
-- SELECT count(*)
-- from Customers
-- WHERE ContactName like 'Mari%'

-- C помощью функции LEN() найдите самое длинное полное имя (имя и фамилия) клиента. 
-- Из какого количества символов, включая пробел, состоит полное имя.

-- SELECT max(len(ContactName))
-- from Customers

-- Посчитайте выручку по каждой неделе 1998-го года. 
-- Какова максимальная недельная выручка? Ответ округлите до запятой.

--  select DATEPART(week,O.OrderDate), round(sum((OD.UnitPrice-OD.UnitPrice*OD.Discount)*OD.Quantity),0) as sum
--  from Orders as O
--  join [Order Details] as OD on O.OrderID = OD.OrderID
--  where year(O.OrderDate) =  '1998'
-- group by DATEPART(week,O.OrderDate)
-- order by sum desc

-- Посчитайте по месяцам количество заказов, которые совершили клиенты из США. 
-- Сколько заказов было сделано в декабре 1996 года?
-- select DATEPART(month,ord.OrderDate), count(orderid)
-- from Customers cs
-- left join Orders ord
-- on cs.customerid = ord.customerid
-- where OrderDate BETWEEN '1996-01-01' and '1996-12-31'
-- and country = 'USA'
-- GROUP by DATEPART(month,ord.OrderDate)

-- select DATEPART(month, OrderDate), EmployeeID, count(OrderID)
-- from Orders
-- group by DATEPART(month, OrderDate), EmployeeID
-- order by count(OrderID) desc

-- Выведите заказы, которые были оформлены в 1997 году. 
-- С помощью CASE добавьте временный столбец. 
-- Если дата фактической доставки (ShippedDate) больше запланированной даты доставки (RequiredDate), 
-- то значение - 'delay", а иначе - 'in time'.
-- С помощью вложенного запроса посчитайте сколько заказов были доставлено с задержкой.

-- SELECT count(*)
-- from
-- (SELECT orderid,
-- case 
-- WHEN ShippedDate > RequiredDate THEN 'delay'
-- ELSE 'in time' end as Ships
-- from Orders
-- where OrderDate BETWEEN '1997-01-01' and '1997-12-31') as Shipss
-- where Ships = 'delay'
