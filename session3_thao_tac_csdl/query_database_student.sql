use c0324h1;

# 1. Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select *
from students
where name like 'h%';
# 2. Hiển thị các thông tin sinh vao thang 8.
select *
from students
where month(dob) = 8;
