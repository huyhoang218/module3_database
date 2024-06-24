use resort;

insert into positions (id_position, name_position)
values (1, 'Quản lý'),
       (2, 'Nhân viên');

insert into levels (id_level, level)
values (1, 'Trung cấp'),
       (2, 'Cao đẳng'),
       (3, 'Đại học'),
       (4, 'Sau đại học');

insert into departments (id_part, name_part)
values (1, 'Sale Marketing'),
       (2, 'Hành chính'),
       (3, 'Phục vụ'),
       (4, 'Quản lý');

insert into staffs (id_staff, name, id_position, id_level, id_part, dob, id_number, salary, phone, email, address)
values (1, 'Nguyễn Văn An', 1, 3, 1, '1970-11-07', '456231786', 10000000, '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng'),
       (2, 'Lê Văn Bình', 1, 2, 2, '1997-04-09', '654231234', 7000000, '0934212314', 'binhlv@gmail.com', '22 Yên Bái'),
       (3, 'Hồ Thị Yến', 1, 3, 2, '1995-12-12', '999231723', 14000000, '0412352315', 'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai'),
       (4, 'Võ Công Toản', 1, 4, 4, '1980-04-04', '123231365', 17000000, '0374443232', 'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị'),
       (5, 'Nguyễn Bỉnh Phát', 2, 1, 1, '1999-12-09', '454363232', 6000000, '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng'),
       (6, 'Khúc Nguyễn An Nghi', 2, 2, 3, '2000-11-08', '964542311', 7000000, '0978653213', 'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng'),
       (7, 'Nguyễn Hữu Hà', 2, 3, 2, '1993-01-01', '534323231', 8000000, '0941234553', 'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế'),
       (8, 'Nguyễn Hà Đông', 2, 4, 4, '1989-09-03', '234414123', 9000000, '0642123111', 'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội'),
       (9, 'Tòng Hoang', 2, 4, 4, '1982-09-03', '256781231', 6000000, '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng'),
       (10, 'Nguyễn Công Đạo', 2, 3, 2, '1994-01-08', '755434343', 8000000, '0988767111', 'nguyencongdao12@gmail.com', '6 Hoà Khánh, Đồng Nai');

insert into customer_types (id_customer_type, name)
values (1, 'Diamond'),
       (2, 'Platinium'),
       (3, 'Gold'),
       (4, 'Silver'),
       (5, 'Member');

insert into customers (id_customer, id_customer_type, name, dob, id_number, phone, email, address)
values (1, 5, 'Nguyễn Thị Hào', '1970-11-07', '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguyễn Hoàng, Đà Nẵng'),
       (2, 3, 'Phạm Xuân Diệu', '1992-08-08', '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, Quảng Trị'),
       (3, 1, 'Trương Đình Nghệ', '1990-02-27', '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 Ông Ích Khiêm, Vinh'),
       (4, 1, 'Dương Văn Quan', '1981-07-08', '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 Lê Lợi, Đà Nẵng'),
       (5, 4, 'Hoàng Trần Nhi Nhi', '1995-12-09', '795453345', '0312345678', 'nhinhi123@gmail.com', '224 Lý Thái Tổ, Gia Lai'),
       (6, 4, 'Tôn Nữ Mộc Châu', '2005-12-0', '732434215', '0988888844','tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng'),
       (7, 1, 'Nguyễn Mỹ Kim', '1984-04-08', '856453123', '0912345698', 'kimcuong84@gmail.com', 'K123/45 Lê Lợi, Hồ Chí Minh'),
       (8, 3, 'Nguyễn Thị Hào', '1999-04-08', '965656433', '0763212345', 'haohao99@gmail.com', '55 Nguyễn Văn Linh, Kon Tum'),
       (9, 1, 'Trần Đại Danh', '1994-07-01', '432341235', '0643343433', 'danhhai99@gmail.com', '24 Lý Thường Kiệt, Quảng Ngãi'),
       (10, 2, 'Nguyễn Tâm Đắc', '1989-07-01', '344343432', '0987654321', 'dactam@gmail.com', '22 Ngô Quyền, Đà Nẵng');

insert into rental_types (id_rental_type, name_rental_type, price)
values (1, 'year', 2000000),
       (2, 'month', 300000),
       (3, 'day', 50000),
       (4, 'hour', 10000);

insert into service_types (id_service_type, name_service_type)
values (1, 'Villa'),
       (2, 'House'),
       (3, 'Room');

insert into services (id_service, name_service, area, number_floors, max_people, rental_costs, id_rental_type, id_service_type, status)
values (1, 'Có hồ bơi', 500, 4, 10, 100000, 3, 1, 'Tốt'),
       (2, 'Có thêm bếp nướng', null, 3, 8, 80000, 2, 2, 'Đầy đủ'),
       (3, 'Có tv', null, null, 8, 100000, 4, 3, 'Ổn'),
       (4, 'Có hồ bơi', 300, 3, 9, 90000, 3, 1, 'Tốt'),
       (5, 'Có thêm ếp nướng', null, 2, 4, 40000, 3, 2, 'Đầy đủ'),
       (6, 'Có tv', null, null, 5, 85000, 4, 3, 'Ổn');

UPDATE resort.services t
SET t.name_service = 'House Princess 01',
    t.area         = 14000,
    t.max_people   = 7,
    t.rental_costs = 5000000
WHERE t.id_service = 2;

UPDATE resort.services t
SET t.name_service = 'Villa No Beach Front',
    t.area         = 22000,
    t.max_people   = 8,
    t.rental_costs = 9000000
WHERE t.id_service = 4;

UPDATE resort.services t
SET t.name_service = 'Room Twin 02',
    t.area         = 3000,
    t.max_people   = 2,
    t.rental_costs = 900000
WHERE t.id_service = 6;

UPDATE resort.services t
SET t.name_service = 'Room Twin 01',
    t.area         = 5000,
    t.max_people   = 2,
    t.rental_costs = 1000000
WHERE t.id_service = 3;

UPDATE resort.services t
SET t.name_service = 'Villa Beach Front',
    t.area         = 25000,
    t.rental_costs = 10000000
WHERE t.id_service = 1;

UPDATE resort.services t
SET t.name_service = 'House Princess 02',
    t.area         = 10000,
    t.max_people   = 5,
    t.rental_costs = 4000000
WHERE t.id_service = 5;

UPDATE resort.services t
SET t.status = 'Có thêm bếp nướng'
WHERE t.id_service = 2;

UPDATE resort.services t
SET t.status = 'Có tivi'
WHERE t.id_service = 6;

UPDATE resort.services t
SET t.status = 'Có hồ bơi'
WHERE t.id_service = 1;

UPDATE resort.services t
SET t.status = 'Có thêm bếp nướng'
WHERE t.id_service = 5;

UPDATE resort.services t
SET t.status = 'Có tivi'
WHERE t.id_service = 3;

UPDATE resort.services t
SET t.status = 'Có hồ bơi'
WHERE t.id_service = 4;




insert into accompanied_services (id_accompanied_service, name_accompanied_service, price, unit, status)
values (1, 'Karaoke', 10000, 'giờ', 'tiện nghi, hiện tại'),
       (2, 'Thuê xe máy', 10000, 'chiếc', 'hỏng 1 xe'),
       (3, 'Thuê xe đạp', 20000, 'chiếc', 'tốt'),
       (4, 'Buffet buổi sáng', 15000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
       (5, 'Buffet buổi trưa', 90000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
       (6, 'Buffet buổi tối', 16000, 'suất', 'đầy đủ đồ ăn, tráng miệng');

insert into contracts (id_contract, id_staff, id_customer, id_service, day_start, day_end, deposit, total_money)
values (1, 3, 1, 3, '2020-12-08', '2020-12-08', 0, 0),
       (2, 7, 3, 1, '2020-07-14', '2020-07-21', 200000, 0),
       (3, 7, 4, 2, '2021-03-15', '2021-03-17', 50000, 0),
       (4, 7, 5, 5, '2021-01-14', '2021-01-18', 100000, 0),
       (5, 7, 2, 6, '2021-07-14', '2021-07-15', 0, 0),
       (6, 7, 7, 6, '2021-06-01', '2021-06-03', 0 , 0),
       (7, 7, 4, 4, '2021-09-02', '2021-09-05', 100000, 0),
       (8, 3, 4, 1, '2021-06-17', '2021-06-18', 150000, 0),
       (9, 3, 4, 3, '2020-11-19', '2020-11-19', 0, 0),
       (10, 10, 3, 5, '2021-04-12', '2021-04-14', 0, 0),
       (11, 2, 2, 1, '2021-04-25', '2021-04-25', 0, 0),
       (12, 7, 10, 1, '2021-05-25', '2021-05-27', 0, 0);

insert into contract_details (id_contract_detail, id_contract, id_accompanied_service, quantity)
values (1, 2, 4, 5),
       (2, 2, 5, 8),
       (3, 2, 6, 15),
       (4, 3, 1, 1),
       (5, 3, 2, 11),
       (6, 1, 3, 1),
       (7, 1, 2, 2),
       (8, 12, 2, 2);