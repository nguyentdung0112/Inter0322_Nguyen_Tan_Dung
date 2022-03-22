Create database khu_nghi_duong;
use khu_nghi_duong;

create table vi_tri(
	ma_vi_tri int primary key,
    ten_vi_tri varchar(45)
);
create table trinh_do(
	ma_trinh_do int primary key,
    ten_trinh_do varchar(45)
);
create table bo_phan(
	ma_bo_phan int primary key,
    ten_bo_phan varchar(45)
);
create table nhan_vien(
	ma_nhan_vien int primary key,
    ho_ten varchar(45),
    ngay_sinh date,
    so_cmnd varchar(45),
    luong Double,
	so_dien_thoai varchar(45),
	email varchar(45),
    dia_chi varchar(45),
    ma_vi_tri int,
    ma_trinh_do int,
    ma_bo_phan int,
    constraint fk_ma_vi_tri FOREIGN key (ma_vi_tri) references vi_tri(ma_vi_tri),
    constraint fk_ma_trinh_do FOREIGN key (ma_trinh_do) references trinh_do(ma_trinh_do),
    constraint fk_ma_bo_phan FOREIGN key (ma_bo_phan) references bo_phan(ma_bo_phan)
);
create table loai_khach(
	ma_loai_khach int primary key,
    ten_loai_khach varchar(45)
);
create table khach_hang(
	ma_khach_hang int primary key,
    ho_ten varchar(45),
    ngay_sinh DATE,
    gioi_tinh BIT(1),
    so_cmnd varchar(45),
    so_dien_thoai varchar(45),
    email varchar(45),
    dia_chi varchar(45),
    ma_loai_khach int
);
create table kieu_thue(
	ma_kieu_thue int primary key,
    ten_kieu_thue varchar(45)
);
create table loai_dich_vu(
	ma_loai_dich_vu int primary key,
    ten_loai_dich_vu varchar(45)
);
create table dich_vu(
	ma_dich_vu int primary key,
    ten_dich_vu varchar(45),
    dien_tich int,
    chi_phi_thue double,
    so_nguoi_toi_da int,
    tieu_chuan_phong varchar(45),
    mo_ta_tien_nghi_khac varchar(45),
    dien_tich_ho_boi double,
    so_tang int,
    ma_kieu_thue int,
    ma_loai_dich_vu int,
    constraint fk_ma_kieu_thue FOREIGN key (ma_kieu_thue) references kieu_thue(ma_kieu_thue),
    constraint fk_ma_loai_dich_vu FOREIGN key (ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu)
);
create table dich_vu_di_kem(
	ma_dich_vu_di_kem int primary key,
    ten_dich_vu_di_kem varchar(45),
    gia double,
    don_vi varchar(10),
    trang_thai varchar(45)
);
create table hop_dong(
	ma_hop_dong int primary key,
    ngay_lam_hop_dong datetime,
    ngay_ket_thuc datetime,
    tien_dat_coc double,
    ma_nhan_vien int,
    ma_khach_hang int,
    ma_dich_vu int,
    constraint fk_ma_nhan_vien FOREIGN key (ma_nhan_vien) references nhan_vien(ma_nhan_vien),
    constraint fk_ma_khach_hang FOREIGN key (ma_khach_hang) references khach_hang(ma_khach_hang),
    constraint fk_ma_dich_vu FOREIGN key (ma_dich_vu) references dich_vu(ma_dich_vu)
);
create table hop_dong_chi_tiet(
	ma_hop_dong_chi_tiet int primary key,
    so_luong int,
    ma_hop_dong int,
    ma_dich_vu_di_kem int,
    constraint fk_ma_hop_dong FOREIGN key (ma_hop_dong) references hop_dong(ma_hop_dong),
    constraint fk_ma_dich_vu_di_kem FOREIGN key (ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem)
);
insert into vi_tri values(1, "Quản lý");
insert into vi_tri values(2, "Nhân viên");

insert into trinh_do values(1, "Trung cấp");
insert into trinh_do values(2, "Cao đẳng");
insert into trinh_do values(3, "Đại học");
insert into trinh_do values(4, "Sau đại học");

insert into bo_phan values(1, "Sale-Marketing");
insert into bo_phan values(2, "Hành chính");
insert into bo_phan values(3, "Phục vụ");
insert into bo_phan values(4, "Quản lý");

insert into nhan_vien
values 
  (1,'Nguyễn Văn An','1970-11-07',456231786,10000000,0901234121,'annguyen@gmail.com','295 Nguyễn Tất Thành, Đà Nẵng',1,3,1),
  (2,'Lê Văn Bình','1997-04-09',654231234,7000000,0934212314,'binhlv@gmail.com','22 Yên Bái, Đà Nẵng',1,2,2),
  (3,'Hồ Thị Yến','1995-12-12',999231723,14000000,0412352315,'thiyen@gmail.com','K234/11 Điện Biên Phủ, Gia Lai',1,3,2),
  (4,'Võ Công Toản','1980-04-04',123231365,17000000,0374443232,'toan0404@gmail.com','77 Hoàng Diệu, Quảng Trị',1,4,4),
  (5,'Nguyễn Bỉnh Phát','1999-12-09',454363232,6000000,0902341231,'phatphat@gmail.com','43 Yên Bái, Đà Nẵng',2,1,1),
  (6,'Khúc Nguyễn An Nghi','2000-11-08',964542311,7000000,0978653213,'annghi20@gmail.com','294 Nguyễn Tất Thành, Đà Nẵng',2,2,3),
  (7,'Nguyễn Hữu Hà','1993-01-01',534323231,8000000,0941234553,'nhh0101@gmail.com','4 Nguyễn Chí Thanh, Huế',2,3,2),
  (8,'Nguyễn Hà Đông','1989-09-03',234414123,9000000,0642123111,'donghanguyen@gmail.com','111 Hùng Vương, Hà Nội',2,4,4),
  (9,'Tòng Hoang','1982-09-03',256781231,6000000,0245144444,'hoangtong@gmail.com','213 Hàm Nghi, Đà Nẵng',2,4,4),
  (10,'Nguyễn Công Đạo','1994-01-08',755434343,8000000,0988767111,'nguyencongdao12@gmail.com','6 Hoà Khánh, Đồng Nai',2,3,2);

insert into loai_khach  
values 
  (1,'Diamond'),
  (2,'Platinium'),
  (3,'Gold'),
  (4,'Silver'),
  (5,'Member');
  
insert into khach_hang 
(ma_khach_hang,ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) 
values 
  (1,'Nguyễn Thị Hào','1970-11-07',0,643431213,0945423362,'thihao07@gmail.com','23 Nguyễn Hoàng, Đà Nẵng',5),
  (2,'Phạm Xuân Diệu','1992-08-08',1,865342123,0954333333,'xuandieu92@gmail.com','K77/22 Thái Phiên, Quảng Trị',3),
  (3,'Trương Đình Nghệ','1990-02-27',1,488645199,0373213122,'nghenhan2702@gmail.com','K323/12 Ông Ích Khiêm, Vinh',1),
  (4,'Dương Văn Quan','1981-07-08',1,543432111,0490039241,'duongquan@gmail.com','K453/12 Lê Lợi, Đà Nẵng',1),
  (5,'Hoàng Trần Nhi Nhi','1995-12-09',0,795453345,0312345678,'nhinhi123@gmail.com','224 Lý Thái Tổ, Gia Lai',4),
  (6,'Tôn Nữ Mộc Châu','2005-12-06',0,732434215,0988888844,'tonnuchau@gmail.com','37 Yên Thế, Đà Nẵng',4),
  (7,'Nguyễn Mỹ Kim','1984-04-08',0,856453123,0912345698,'kimcuong84@gmail.com','K123/45 Lê Lợi, Hồ Chí Minh',1),
  (8,'Nguyễn Thị Hào','1999-04-08',0,965656433,0763212345,'haohao99@gmail.com','55 Nguyễn Văn Linh, Kon Tum',3),
  (9,'Trần Đại Danh','1994-07-01',1,432341235,0643343433,'danhhai99@gmail.com','24 Lý Thường Kiệt, Quảng Ngãi',1),
  (10,'Nguyễn Tâm Đắc','1989-07-01',1,344343432,0987654321,'dactam@gmail.com','22 Ngô Quyền, Đà Nẵng',2);
  
insert into kieu_thue 
values 
  (1,'year'),
  (2,'month'),
  (3,'day'),
  (4,'hour');
  
insert into loai_dich_vu 
values 
  (1,'Villa'),
  (2,'House'),
  (3,'Room');
  
insert into dich_vu 
  (ma_dich_vu,ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,ma_kieu_thue,ma_loai_dich_vu) 
values 
  (1,'Villa Beach Front',25000,10000000,10,'vip','Có hồ bơi','500','4',3,1),
  (2,'House Princess 01',14000,5000000,7,'vip','Có thêm bếp nướng',null,'3',2,2),
  (3,'Room Twin 01',5000,1000000,2,'normal','Có tivi',null,null,4,3),
  (4,'Villa No Beach Front',22000,9000000,8,'normal','Có hồ bơi','300','3',3,1),
  (5,'House Princess 02',10000,4000000,5,'normal','Có thêm bếp nướng',null,'2',3,2),
  (6,'Room Twin 02',3000,900000,2,'normal','Có tivi',null,null,4,3);
  
insert into dich_vu_di_kem 
values 
  (1,'Karaoke',10000,'giờ','tiện nghi, hiện tại'),
  (2,'Thuê xe máy',10000,'chiếc','hỏng 1 xe'),
  (3,'Thuê xe đạp',20000,'chiếc','tốt'),
  (4,'Buffet buổi sáng',15000,'suất','đầy đủ đồ ăn, tráng miệng'),
  (5,'Buffet buổi trưa',90000,'suất','đầy đủ đồ ăn, tráng miệng'),
  (6,'Buffet buổi tối',16000,'suất','đầy đủ đồ ăn, tráng miệng');
  
insert into hop_dong 
values 
  (1,'2020-12-08','2020-12-08',0,3,1,3),
  (2,'2020-07-14','2020-07-21',200000,7,3,1),
  (3,'2021-03-15','2021-03-17',50000,3,4,2),
  (4,'2021-01-14','2021-01-18',100000,7,5,5),
  (5,'2021-07-14','2021-07-15',0,7,2,6),
  (6,'2021-06-01','2021-06-03',0,7,7,6),
  (7,'2021-09-02','2021-09-05',100000,7,4,4),
  (8,'2021-06-17','2021-06-18',150000,3,4,1),
  (9,'2020-11-19','2020-11-19',0,3,4,3),
  (10,'2021-04-12','2021-04-14',0,10,3,5),
  (11,'2021-04-25','2021-04-25',0,2,2,1),
  (12,'2021-05-25','2021-05-27',0,7,10,1);
  select * from khach_hang;
insert into hop_dong_chi_tiet 
  (ma_hop_dong_chi_tiet,so_luong,ma_hop_dong,ma_dich_vu_di_kem) 
values
  (1,5,2,4),
  (2,8,2,5),
  (3,15,2,6),
  (4,1,3,1),
  (5,11,3,2),
  (6,1,1,3),
  (7,2,1,2),
  (8,2,12,2);
  
-- cau2

select * from nhan_vien 
where SUBSTRING(ho_ten,1,1) = 'H' or SUBSTRING(ho_ten,1,1) = 'T' or SUBSTRING(ho_ten,1,1) = 'K' and  length(ho_ten) <= 15;

-- cau3
select * from khach_hang 
where round(datediff(curdate(),ngay_sinh) / 365,0) >= 18 
and round(datediff(curdate(),ngay_sinh) / 365,0) <= 50 
and dia_chi LIKE '%Đà Nẵng' or dia_chi Like '%Quảng Trị';

-- cau4
SELECT kh.ma_khach_hang, kh.ho_ten, COUNT(kh.ho_ten) as  so_lan_dat_phong FROM khach_hang kh 
INNER JOIN loai_khach lk on kh.ma_loai_khach= lk.ma_loai_khach
INNER JOIN hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang WHERE lk.ten_loai_khach ='DIAMOND'
group by ho_ten
order by COUNT(kh.ho_ten) asc;


select k.ma_khach_hang, ho_ten, count(h.ma_khach_hang) as so_lan_dat_phong from hop_dong h, khach_hang k
where h.ma_khach_hang = k.ma_khach_hang and ma_loai_khach = 1 
group by ma_khach_hang 
order by count(h.ma_khach_hang) asc;

-- câu 5: 
select khach_hang.ma_khach_hang, khach_hang.ho_ten, loai_khach.ten_loai_khach, hop_dong.ma_hop_dong, dich_vu.ten_dich_vu, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc,
count(hop_dong_chi_tiet.so_luong * dich_vu_di_kem.gia) + dich_vu.chi_phi_thue as tong_tien from loai_khach
left join khach_hang on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach 
left join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
left join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
left join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
left join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
group by khach_hang.ma_khach_hang;

-- Câu 6:

Select distinct dv.ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
from dich_vu dv  inner join loai_dich_vu ldv on ldv.ma_loai_dich_vu =
dv.ma_loai_dich_vu
where dv.ma_dich_vu not in (Select dv.ma_dich_vu 
from dich_vu dv inner join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
where Year(ngay_lam_hop_dong) = 2021 and (month(ngay_lam_hop_dong) = 1 or 
month(ngay_lam_hop_dong) = 2 or month(ngay_lam_hop_dong) = 3));

-- Câu 7: 

Select distinct dv.ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
from dich_vu dv 
inner join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
inner join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
where year(ngay_lam_hop_dong) = 2020 and dv.ma_loai_dich_vu not in ( select dv.ma_dich_vu
from dich_vu dv inner join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
where year(ngay_lam_hop_dong) = 2021);

-- Câu 8: cach1
SELECT ho_ten , COUNT(*) so_nguoi FROM khach_hang GROUP BY ho_ten ;
-- cách 2:
select distinct khach_hang.ho_ten from khach_hang;
-- cách 3:
select khach_hang.ho_ten from khach_hang group by khach_hang.ho_ten;

-- Câu 9:

select month(ngay_lam_hop_dong) as thang, count(*) so_luong_khach_hang
from hop_dong
where year(ngay_lam_hop_dong) = 2021
group by thang;

-- Câu 10:

select 
hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc,
sum(hdct.so_luong) as so_luong_dich_vu_di_kem
from hop_dong hd
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
group by ma_hop_dong
order by ma_hop_dong asc;

-- Câu 11:

select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem
from dich_vu_di_kem dvdk
inner join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
inner join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
inner join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
inner join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
where kh.dia_chi like "%Vinh%" or kh.dia_chi like "%Quảng Ngãi%" and lk.ten_loai_khach = 'Diamond' ;

-- Câu 12:

Select hd.ma_hop_dong, nv.ho_ten as ho_ten_nhan_vien, kh.ho_ten as ho_ten_khach_hang, kh.so_dien_thoai, ten_dich_vu, ifnull(sum(so_luong), 0) as so_luong_dich_vu_di_kem, tien_dat_coc
from dich_vu dv right join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
				left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
                left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
				inner join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
                inner join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
where dv.ma_dich_vu in (select dv.ma_dich_vu from dich_vu dv inner join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
					where (year(ngay_lam_hop_dong)=2020 and month(ngay_lam_hop_dong) in ("10", "11", "12")))
and dv.ma_dich_vu not in (select dv.ma_dich_vu from dich_vu dv inner join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
					where (year(ngay_lam_hop_dong)=2021 and month(ngay_lam_hop_dong) in (1, 2, 3, 4, 5, 6)))
group by hd.ma_hop_dong, nv.ho_ten, kh.ho_ten, kh.so_dien_thoai, ten_dich_vu;

-- Câu 13:
Select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, sum(hdct.so_luong) as so_luong_dich_vu_di_kem
from dich_vu_di_kem dvdk
inner join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by hdct.ma_dich_vu_di_kem
order by so_luong_dich_vu_di_kem desc
limit 2;

-- Câu 14:

Select  hdct.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem,
 count(hdct.ma_dich_vu_di_kem) as so_lan_su_dung
from dich_vu_di_kem dvdk
inner join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
inner join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
inner join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
inner join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
group by hdct.ma_dich_vu_di_kem
having so_lan_su_dung = 1
order by hdct.ma_dich_vu_di_kem;

-- Câu 15: 

select distinct nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi
from nhan_vien nv
inner join bo_phan bp on bp.ma_bo_phan = nv.ma_bo_phan
inner join trinh_do td on td.ma_trinh_do = nv.ma_trinh_do
inner join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
group by hd.ma_nhan_vien
having count(hd.ma_nhan_vien) <=3;

-- Câu 16:

Delete from nhan_vien
where ma_nhan_vien not in (Select nv.ma_nhan_vien
from nhan_vien nv inner join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where (year(ngay_lam_hop_dong) in (2019, 2020, 2021)));
delete from nhan_vien where not exists (
select nhan_vien.ma_nhan_vien from hop_dong 
where hop_dong.ngay_lam_hop_dong  
between "2018-01-01" and "2019-12-31" and hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien);
-- Câu 17:

update khach_hang,(select hop_dong.ma_khach_hang as id, sum(hop_dong.Tong_Tien) as tong_tien from hop_dong 
where year(hop_dong_ngay_lam_hop_dong) = 2019
group by hop_dong.ma_khach_hang
having tong_tien>10000000 )as temp set khach_hang.ma_loai_khach =(select loai_khach.ma_loai_khach from loai_khach 
where loai_khach.ten_loai_khach="Diamond")
where khach_hang.ma_loai_khach =(select loai_khach.ma_loai_khach from loai_khach 
where loai_khach.ten_loai_khach="Platinum" and temp.id=khach_hang.ma_khach_hang);



-- Cau 18
Delete from khach_hang where ma_khach_hang in (Select kh.ma_khach_hang
from khach_hang kh inner join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
where (year(ngay_lam_hop_dong)<2021));

-- Cau 19
SET SQL_SAFE_UPDATES=0;
Update furama_danang.dich_vu_di_kem
set gia = gia*2
where ma_dich_vu_di_kem in (select ma_dich_vu_di_kem
from hop_dong_chi_tiet hdct inner join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
where (year(ngay_lam_hop_dong) = 2020 and so_luong>=10));
SET SQL_SAFE_UPDATES=1;

-- Cau 20
Select ma_nhan_vien as id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from nhan_vien
union
select ma_khach_hang as id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from khach_hang
