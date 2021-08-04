--UNION - merge two select statements 
--UNION ALL - does not remove duplicate records
/*
select NULL as "prod_id", sum(ol.quantity)
FROM orderlines as ol

UNION

select prod_id as "prod_id", sum(ol.quantity)
from orderlines as ol
group by prod_id
order by prod_id desc
*/
--GROUPING SETS - a subclause of group by that allows us to define multiple groupings.
--same can be done using GROUPING SETS
/*
select prod_id, orderlineid, sum(ol.quantity)
from orderlines as ol
group by 
    grouping sets (
        (),
        (prod_id),
        (orderlineid)
        )
order by prod_id DESC, orderlineid DESC
*/