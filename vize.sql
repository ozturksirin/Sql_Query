use dbDepo
/*
select tblUrunler.UrunId, tblUrunler.Adi as '�r�n Ad�',tblUrunler.Resim,tblUrunler.Fiyat,tblUrunler.Detay,tblCins.Adi as 'Ayakkab� T�r�' from tblUrunler inner join tblUrunSex on tblUrunler.UrunSexId=tblUrunSex.UrunSexId 
inner join tblCins on tblUrunler.UrunCinsId=tblCins.CinsId inner join tblKategori 
on tblCins.KatId=tblKategori.KatId
where tblUrunSex.Adi='Kad�n' and tblKategori.KategoriAdi='Ayakkab�' and tblUrunler.Stok >=100 
order by tblUrunler.Stok desc


select sum(Miktar) as 'Toplam �r�n Miktar�' from tblIslem where (Tarih between '01.10.2022' and '05.10.2022') 
and TurId=1 and IslemKulId=15

select sum(Miktar) as 'Toplam �r�n Miktar�' from tblIslem 
inner join tblIslemTur on tblIslem.TurId=tblIslemTur.Turid 
inner join tblKullanici on tblKullanici.Kullid=tblIslem.IslemKulId
where (Tarih between '01.10.2022' and '05.10.2022') 
and tblIslemTur.Ad='Giri�' and tblKullanici.Ad='Oguzhan'
*/
select * from tblKullTur

insert into tblKullanici (KulTurId,Ad,Soyad,Tlf,Mail,Adres,Resim) 
values (3,'Adem','Korkmaz','05322443934','adem@korkmazadem.com','Band�rma','adem.png')


select * from tblKullanici

--y�neticilerin bilgilerini yazd�r�n�z.

select kt.Ad,k.Ad,k.Soyad,k.Tlf from tblKullanici k inner join tblKullTur kt
on k.KulTurId=kt.id where kt.Ad='y�netici' 

/*nokta at��� direkt belli olan ki�inin parametresini g�nceller*/
update tblKullanici set KulTurId=3 where Kullid=7

/*kullId bilinmiyorsa, ismi belli olan ki�i veya ki�ileri g�nceller*/
update tblKullanici set KulTurId=3 where Ad='Enes'

/*belli parametreler g�re aran�p bulunan ki�inin de�erlerini g�ncelleme*/
select Ad,Soyad,Tlf from tblKullanici WHERE Ad='Enes'

update tblKullanici set KulTurId=2 where Kullid in 
(select Kullid from tblKullanici WHERE Ad='Enes')

/*�r�nlere ait cinsiyet kategorilerinin giri�i*/
insert into tblUrunSex (Adi,Detay,Resim) 
values ('Unisex','Hem kad�n hemde erkeklere ait �r�nler','unisexurunkategori.jpg')

select * from tblBeden

--Depodaki �r�nlerin fiyat ortalamas�n� veren sorguyu yaz�n�z?

select AVG(Fiyat) as ortalama from tblUrunler

--Depodaki �r�nlerin fiyat ortalamas�n� veren sorguyu AVG parametresi kullanmadan yaz�n�z?

select sum (u.Fiyat) from tblUrunler u
select count(u.Fiyat) from tblUrunler u

select (sum(Fiyat)/count(*)) from tblUrunler

--En y�ksek Fiyat ile en d���k fiyat�n toplam�n� toplam �r�n say�s�na b�len sorguyu yaz�n�z.

select max(Fiyat) from tblUrunler
select min(Fiyat) from tblUrunler

select ((max(Fiyat)+min(Fiyat))/count(*)) from tblUrunler

--En y�ksek Fiyat ile en d���k fiyat�n ortalamas� i�in

select (max(Fiyat)+min(fiyat))/2 from tblUrunler 

--en y�ksek fiyatl� �r�n/�r�nlerin bulundu�u kategorinin ad�n� listeleyen sorguyu yaz�n�z?

select u.Adi,k.KategoriAdi,u.Fiyat from tblUrunler u inner join tblCins c
on u.UrunCinsId=c.CinsId inner join tblKategori k
on k.KatId=c.KatId where u.Fiyat in(select max(Fiyat) from tblUrunler)

-- hangi cins t�r�nde ka� tane �r�n oldu�unu listeleyen sorguyu yaz�n�z?

select c.Adi,COUNT(*) from tblUrunler u inner join tblCins c
on u.UrunCinsId=c.CinsId group by c.Adi

--kategorilerde ka� �e�it �r�n old�unu listeyen sorguyu yaz�n�z?

select k.KategoriAdi,count(*) from tblKategori k inner join tblCins c
on k.KatId=c.KatId inner join tblUrunler u
on u.UrunCinsId=c.CinsId group by k.KategoriAdi


--tekli g�ncelleme
--UPDATE tblUrunler SET Stok =  (SELECT Miktar FROM tblIslem WHERE TurId = 1 and UrunId=2) WHERE tblUrunler.UrunId = 2

--- �oklu g�ncelleme
--update tblUrunler set Stok=Stok+{1} where UrunId={0} (select UrunId,Miktar from tblIslem where TurId=1 )

 -- giri� i�lemi yapan m��terilerim bilgileri 

select * from tblIslem
select * from tblIslemTur

select * from tblKullanici where Kullid in 
(select IslemKulId from tblIslem where TurId=1)

select * from tblKullanici where 
exists (select * from tblIslem where TurId=1 and tblKullanici.Kullid=tblIslem.IslemKulId)

--i�lem yapmayan 
select * from tblKullanici where 
not exists (select * from tblIslem where TurId=1 and tblKullanici.Kullid=tblIslem.IslemKulId)

-- en fazla �r�n gri�i ger�ekle�tirren ki�i yi bulan sorguyu yaz�n�z?
select top 1 IslemKulId, tblKullanici.Ad, SUM(Miktar) as toplamGiris from tblIslem 
inner join tblKullanici on tblIslem.IslemKulId=tblKullanici.Kullid 
where TurId in (select Turid from tblIslemTur where Ad='Giri�') group by IslemKulId, tblKullanici.Ad order by toplamGiris desc

--35 37 numara ayakkab�lar� getirsin
select * from tblUrunler 
inner join tblBeden on tblUrunler.UrunBedenId=tblBeden.Id
inner join tblUrunSex on tblUrunler.UrunSexId=tblUrunSex.UrunSexId
where tblUrunler.UrunCinsId=1 and tblUrunSex.UrunSexId=1 and
tblBeden.Olcu between 35 and 37

