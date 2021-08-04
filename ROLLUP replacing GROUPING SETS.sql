--How much was sold on the year, month and day available? 
/*
SELECT EXtract (YEAR from orderdate) as "year",
       EXtract (MONTH from orderdate) as "month",
       EXtract (DAY from orderdate) as "day",
       sum(ol.quantity)
FROM orderlines as ol
group by 
    grouping sets(
        (Extract (YEAR from orderdate)),
        (
            extract (Year from orderdate),
            extract (month from orderdate)
        ),
        (
            extract (Year from orderdate),
            extract (Month from orderdate),
            extract (Day from orderdate)
        ),
        (
            extract (month from orderdate),
            extract (day from orderdate)
        ),
        (extract (month from orderdate)),
        (extract (day from orderdate)),
        ()
    )
order by
    extract (year from orderdate),
    extract (month from orderdate),
    extract (day from orderdate)
*/
--Instead of doing above using ROLLUP
/*
SELECT EXtract (YEAR from orderdate) as "year",
       EXtract (MONTH from orderdate) as "month",
       EXtract (DAY from orderdate) as "day",
       sum(quantity) as "Quantity sold"
FROM orderlines
group by 
    rollup (
        Extract (Year From orderdate),
        extract (month from orderdate),
        extract (day from orderdate)
    )
order by
    extract (year from orderdate),
    extract (month from orderdate),
    extract (day from orderdate)
*/