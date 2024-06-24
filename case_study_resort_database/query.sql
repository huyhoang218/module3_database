use resort;
# 2
select *
from staffs
where (name like 'H%' or name like 'T%' or name like 'K%')
  and length(name) <= 15;
# 3
select *
from customers
where (address like '%Đà Nẵng' or address like '%Quảng Trị')
  and ((year(curdate()) - year(dob)) between 18 and 50);
# 4
select customers.id_customer,
       customers.name,
       count(contracts.id_contract) as booking_count
from customers
         join customer_types on customers.id_customer_type = customer_types.id_customer_type
         join contracts on customers.id_customer = contracts.id_customer
where customer_types.name = 'Diamond'
group by customers.id_customer, customers.name
order by booking_count;
# 5
select customers.id_customer                                          as cumstomer_id,
       customers.name                                                 as customer_name,
       customer_types.name                                            as customer_type,
       contracts.id_contract                                          as constract_id,
       services.name_service                                          as name_service,
       contracts.day_start                                            as start_day,
       contracts.day_end                                              as end_day,
       (services.rental_costs + coalesce(cd.quantity * acs.price, 0)) as total_money
from customers
         left join customer_types on customers.id_customer_type = customer_types.id_customer_type
         left join contracts on customers.id_customer = contracts.id_customer
         left join services on contracts.id_service = services.id_service
         left join contract_details cd on contracts.id_contract = cd.id_contract
         left join accompanied_services acs on cd.id_accompanied_service = acs.id_accompanied_service
group by customers.id_customer, customers.name, customer_types.name, contracts.id_contract, services.name_service,
         contracts.day_start, contracts.day_end, (services.rental_costs + coalesce(cd.quantity * acs.price, 0));
# 6.
select services.id_service,
       services.name_service,
       services.area,
       services.rental_costs,
       service_types.name_service_type
from services
         join service_types on services.id_service_type = service_types.id_service_type
         left join contracts c
                   on services.id_service = c.id_service and c.day_start >= '2021-01-01' and c.day_start < '2021-04-01'
where c.id_contract is null;
# 7.
select s.id_service,
       s.name_service,
       s.area,
       s.max_people,
       s.rental_costs,
       st.name_service_type
from services s
         join service_types st on s.id_service_type = st.id_service_type
where s.id_service in (select distinct ctr2020.id_service
                       from contracts ctr2020
                       where year(ctr2020.day_start) = 2020)
  and s.id_service not in (select distinct ctr2021.id_service
                           from contracts ctr2021
                           where year(ctr2021.day_start) = 2021);
# 8.
# c1
select distinct name
from customers;
# c2
select name
from customers
group by name;
# 9.
select month(contracts.day_start) as month, count(distinct contracts.id_customer) as number_of_customer
from contracts
where year(day_start) = 2021
group by month(day_start)
order by month;
# 10.
select contracts.id_contract,
       contracts.day_start,
       contracts.day_end,
       contracts.deposit,
       contract_details.quantity,
       count(contract_details.id_contract_detail) as count_service_accompanied
from contracts
         left join contract_details on contracts.id_contract = contract_details.id_contract
group by contracts.id_contract, contracts.day_start, contracts.day_end, contracts.deposit
order by contracts.id_contract;
# 11.
select accompanied_services.id_accompanied_service, accompanied_services.name_accompanied_service
from accompanied_services
         join contract_details on accompanied_services.id_accompanied_service = contract_details.id_accompanied_service
         join contracts on contract_details.id_contract = contracts.id_contract
         join customers on contracts.id_customer = customers.id_customer
         join customer_types on customers.id_customer_type = customer_types.id_customer_type
where customer_types.name = 'Diamond' and customers.address like '%Vinh'
   or customers.address like '%Quảng Ngãi';
# 12.
select contracts.id_contract,
       staffs.name,
       customers.name,
       customers.phone,
       services.name_service,
       sum(contract_details.quantity) as number_service_accompanied,
       contracts.deposit
from contracts
         join customers on contracts.id_customer = customers.id_customer
         join staffs on contracts.id_staff = staffs.id_staff
         join services on contracts.id_service = services.id_service
         left join contract_details on contracts.id_contract = contract_details.id_contract
where contracts.id_service in (select distinct contracts.id_service
                               from contracts
                               where day_start between '2019-10-01' and '2019-12-31')
  and contracts.id_service not in (select distinct contracts.id_service
                                   from contracts
                                   where day_start between '2019-01-01' and '2019-06-30')
group by contracts.id_contract, staffs.name, customers.name, customers.phone, services.name_service, contracts
order by contracts.id_contract;
# 13.
with ServiceUsage as (select cd.id_accompanied_service,
                             acs.name_accompanied_service,
                             acs.price,
                             acs.unit,
                             acs.status,
                             count(*) as usage_count
                      from Contract_Details cd
                               join
                           Contracts ctr on cd.id_contract = ctr.id_contract
                               join
                           Accompanied_Services acs on cd.id_accompanied_service = acs.id_accompanied_service
                      group by cd.id_accompanied_service,
                               acs.name_accompanied_service,
                               acs.price,
                               acs.unit,
                               acs.status),
     MaxUsage as (select max(usage_count) as max_usage
                  from ServiceUsage)
select su.id_accompanied_service,
       su.name_accompanied_service,
       su.price,
       su.unit,
       su.status,
       su.usage_count
from ServiceUsage su
         join
     MaxUsage mu on su.usage_count = mu.max_usage;
# 14.
SELECT
    cd.id_contract AS IDHopDong,
    st.name_service_type AS TenLoaiDichVu,
    acs.name_accompanied_service AS TenDichVuDiKem,
    COUNT(cd.id_accompanied_service) AS SoLanSuDung
FROM
    Contract_Details cd
        JOIN
    Contracts ctr ON cd.id_contract = ctr.id_contract
        JOIN
    Services srv ON ctr.id_service = srv.id_service
        JOIN
    Service_Types st ON srv.id_service_type = st.id_service_type
        JOIN
    Accompanied_Services acs ON cd.id_accompanied_service = acs.id_accompanied_service
GROUP BY
    cd.id_contract,
    st.name_service_type,
    acs.name_accompanied_service
HAVING
    COUNT(cd.id_accompanied_service) = 1;
# 15.
SELECT
    stf.id_staff AS IDNhanVien,
    stf.name AS HoTen,
    lvl.level AS TrinhDo,
    dept.name_part AS TenBoPhan,
    stf.phone AS SoDienThoai,
    stf.address AS DiaChi
FROM
    Staffs stf
        JOIN
    Levels lvl ON stf.id_level = lvl.id_level
        JOIN
    Departments dept ON stf.id_part = dept.id_part
        LEFT JOIN
    Contracts ctr ON stf.id_staff = ctr.id_staff AND ctr.day_start BETWEEN '2018-01-01' AND '2019-12-31'
GROUP BY
    stf.id_staff,
    stf.name,
    lvl.level,
    dept.name_part,
    stf.phone,
    stf.address
HAVING
    COUNT(ctr.id_contract) <= 3;
# 16.
DELETE FROM Staffs
WHERE id_staff NOT IN (
    SELECT DISTINCT ctr.id_staff
    FROM Contracts ctr
    WHERE ctr.day_start BETWEEN '2017-01-01' AND '2019-12-31'
);
# 17.
UPDATE Customers c
    JOIN (
        SELECT
            ctr.id_customer,
            SUM(ctr.total_money) AS total_payment
        FROM
            Contracts ctr
        WHERE
            YEAR(ctr.day_start) = 2019
        GROUP BY
            ctr.id_customer
        HAVING
            total_payment > 10000000
    ) AS temp ON c.id_customer = temp.id_customer
    JOIN Customer_Types ct ON c.id_customer_type = ct.id_customer_type
SET
    c.id_customer_type = (
        SELECT id_customer_type
        FROM Customer_Types
        WHERE name = 'Diamond'
    )
WHERE
    ct.name = 'Platinium';
# 18.
START TRANSACTION;

DELETE cd
FROM Contract_Details cd
         JOIN Contracts ctr ON cd.id_contract = ctr.id_contract
WHERE ctr.day_start < '2016-01-01';

DELETE FROM Contracts
WHERE day_start < '2016-01-01';

DELETE FROM Customers
WHERE id_customer IN (
    SELECT DISTINCT ctr.id_customer
    FROM Contracts ctr
    WHERE ctr.day_start < '2016-01-01'
);

COMMIT;

# 19.
UPDATE Accompanied_Services acs
    JOIN (
        SELECT cd.id_accompanied_service
        FROM Contract_Details cd
                 JOIN Contracts ctr ON cd.id_contract = ctr.id_contract
        WHERE YEAR(ctr.day_start) = 2019
        GROUP BY cd.id_accompanied_service
        HAVING COUNT(cd.id_accompanied_service) > 10
    ) AS used_services ON acs.id_accompanied_service = used_services.id_accompanied_service
SET acs.price = acs.price * 2;
# 20.
SELECT
    stf.id_staff,
    stf.name,
    stf.email,
    stf.phone,
    stf.dob ,
    stf.address,
    'NhanVien' AS Type
FROM
    Staffs stf
UNION
SELECT
    cus.id_customer,
    cus.name,
    cus.email,
    cus.phone,
    cus.dob,
    cus.address,
    'KhachHang' AS Type
FROM
    Customers cus;
