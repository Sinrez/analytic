-- SELECT * FROM learn_schema.purchases

-- select * from learn_schema.purchases as pu
-- order by pu.PURDATE desc
-- limit 10

-- select * from learn_schema.purchases

-- select * 
-- from learn_schema.purchases as pu
-- join learn_schema.articulss as ar
-- on pu.VENDORCODE = ar.VENDORCODE
-- join learn_schema.type1 as ty
-- on ty.TYPEID = ar.PRODUCTTYPE
-- where ar.AMOUNT >2
-- and pu.PURDATE between '2020-01-01' and '2030-01-01'

-- select count(amount), pu.VENDORCODE
-- from learn_schema.purchases as pu
-- group by pu.VENDORCODE

-- SELECT AVG(PRICE),PRODUCTCATEGORY
-- FROM learn_schema.VENDORS
-- WHERE PRODUCTCATEGORY=1
-- GROUP BY PRODUCTCATEGORY

-- SELECT * FROM learn_schema.type1

-- SELECT VENDORCODE
-- FROM learn_schema.purchases
-- GROUP BY VENDORCODE
-- HAVING SUM(AMOUNT)>10

-- select max(ar.AMOUNT), ty.TYPENAME
-- from learn_schema.articulss as ar
-- join learn_schema.type1 as ty
-- group by ty.TYPENAME
-- order by  max(ar.AMOUNT) desc

-- select *
-- from learn_schema.purchases p
-- inner join learn_schema.customer c on p.id = c.id
-- inner join learn_schema.arcticles ar on p.VENDORCODE = ar.VENDORCODE
-- inner join learn_schema.type_p tp on tp.idtype_p = ar.PRODUCTTYPE

-- (select * 
-- from learn_schema.purchases p1
-- where p1.id in (1,3,5,7)
-- group by id)
-- union all
-- (select * 
-- from learn_schema.purchases p2
-- where p2.id not in (1,3,5,7)
-- group by id)

-- дата первой и последней покупки
-- (select * 
-- from learn_schema.purchases p
-- order by PURDATE asc
-- limit 1)
-- union all
-- (select * 
-- from learn_schema.purchases p
-- order by PURDATE desc
-- limit 1)


