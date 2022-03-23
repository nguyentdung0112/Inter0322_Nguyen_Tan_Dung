use khu_nghi_duong;
-- 21.
CREATE VIEW nhan_vien_v AS
SELECT nv.ma_nhan_vien,	nv.ho_ten, nv.ngay_sinh, nv.so_cmnd, nv.luong,
nv.so_dien_thoai, nv.email, nv.dia_chi,	nv.ma_vi_tri, nv.ma_trinh_do,	nv.ma_bo_phan
FROM nhan_vien nv
inner join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
where nv.dia_chi like "%Hải Châu%" and hd.ngay_lam_hop_dong like "%2019-12-12%";

select * from nhan_vien_v;

-- 22.	
Update nhan_vien_v
set dia_chi="Liên Chiểu";
-- 23
DELIMITER $$
create procedure sp_xoa_khach_hang(in customerId int)
begin
delete  from khach_hang where customerID= customerId;
end; $$
DELIMITER 
-- thực thi
call sp_xoa_khach_hang(1);

-- 24
DELIMITER //
create procedure sp_them_moi_hop_dong(maHopDong int, ngayLamHopDong datetime, ngayKetThuc datetime,
										tienDatCoc double, maNhanVien int, maKhachHang int, maDichVu int)
begin
	if (maHopDong in (select ma_hop_dong from hop_dong)) then
		signal sqlstate '45000' set message_text = "Mã hợp đồng đã tồn tại.";
	end if;
    if (ngayLamHopDong > ngayKetThuc) then
		signal sqlstate '45000' set message_text = "Ngày làm hợp đồng không được phép lớp hơn ngày kết thúc.";
	end if;
    if (maNhanVien not in (select ma_nhan_vien from nhan_vien)) then
		signal sqlstate '45000' set message_text = "Mã nhân viên không tồn tại.";
	end if;
    if (maKhachHang not in (select ma_khach_hang from khach_hang)) then
		signal sqlstate '45000' set message_text = "Mã khách hàng không tồn tại.";
	end if;
    if (maDichVu not in (select ma_dich_vu from dich_vu)) then
		signal sqlstate '45000' set message_text = "Mã dịch vụ không tồn tại.";
	end if;
    insert into hopdong
    values (maHopDong, ngayLamHopDong, ngayKetThuc, tienDatCoc, maNhanVien, maKhachHang, maDichVu);
end //
DELIMITER ;

call sp_them_moi_hop_dong(1, '2022-03-23', '2022-03-30', 0, 1, 1, 1);

call khu_nghi_duong.sp_them_moi_hop_dong(13, '2020-12-08', '2020-12-10', 1000000, 2, 10, 1);
-- 25


DELIMITER //
create trigger tr_xoa_hop_dong after delete on hop_dong 
for each row
begin
	select concat("Còn lại ", (select count(*) as hd_con_lai from hop_dong), " hợp đồng.") 
		AS LOG INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/log.txt';
end //
DELIMITER ;

drop trigger if exists tr_xoa_hop_dong;
 delete from hop_dong where ma_hop_dong = 13;
 insert into hop_dong value (13,	'2021-06-17',	'2021-06-18',	150000,	3,	4,	1);

-- 26
DELIMITER //
create trigger tr_cap_nhat_hop_dong before update on hop_dong
for each row
begin
	if (new.ngay_ket_thuc - new.ngay_lam_hop_dong < 2) then
		signal sqlstate '45000' set message_text = "Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày.";
	end if;
end //
DELIMITER ;

drop trigger if exists tr_cap_nhat_hop_dong;

update hop_dong set ngay_ket_thuc = '2021-06-20' where ma_hop_dong = 8;

-- 27
-- cau a
delimiter // 
	create function func_dem_dich_vu ()
    returns int
    deterministic
		begin
			declare result int;
            set result = (select count(dich_vu.ma_dich_vu) from dich_vu 
            inner join (select hop_dong.ma_dich_vu, sum(chi_phi_thue) as tong_tien
				from hop_dong, dich_vu 
                where hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
                group by ma_dich_vu
                having tong_tien > 2000000) as a on a.ma_dich_vu = dich_vu.ma_dich_vu);
            return result;
        end;
// delimiter ;

select func_dem_dich_vu () as tong_dich_vu_sd_tren_2tr;

-- cau b
delimiter //
create function func_tinh_thoi_gian_hop_dong(ma_kh int)
returns int
deterministic
	begin
		declare result int;
        set result = (select max(datediff(ngay_ket_thuc, ngay_lam_hop_dong)) from hop_dong where ma_khach_hang = ma_kh);
        return result;
    end;
// delimiter ;

select func_tinh_thoi_gian_hop_dong(5) as thoi_gian_hop_dong_dai_nhat;

-- Cau 28
Delimiter //
drop procedure if exists sp_xoa_dich_vu_va_hd_room;
create procedure sp_xoa_dich_vu_va_hd_room()
begin
	drop table if exists tmp_table;
	create table tmp_table(ma_hop_dong int, ma_dich_vu int);
	insert into tmp_table Select ma_hop_dong, dv.ma_dich_vu from hop_dong hd left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
										inner join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
							where (ten_loai_dich_vu = "Room") and (year(ngay_lam_hop_dong) in (2015, 2016, 2017, 2018, 2019));
	delete from hop_dong_chi_tiet where ma_hop_dong in (select ma_hop_dong from tmp_table);
    delete from hop_dong where ma_hop_dong in (select ma_hop_dong from tmp_table);
    delete from dich_vu where ma_dich_vu in (select ma_dich_vu from tmp_table);
end //
delimiter ;

call sp_xoa_dich_vu_va_hd_room();
