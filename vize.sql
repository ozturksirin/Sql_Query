use dbDepo
/*
select tblUrunler.UrunId, tblUrunler.Adi as 'Ürün Adý',tblUrunler.Resim,tblUrunler.Fiyat,tblUrunler.Detay,tblCins.Adi as 'Ayakkabý Türü' from tblUrunler inner join tblUrunSex on tblUrunler.UrunSexId=tblUrunSex.UrunSexId 
inner join tblCins on tblUrunler.UrunCinsId=tblCins.CinsId inner join tblKategori 
on tblCins.KatId=tblKategori.KatId
where tblUrunSex.Adi='Kadýn' and tblKategori.KategoriAdi='Ayakkabý' and tblUrunler.Stok >=100 
order by tblUrunler.Stok desc


select sum(Miktar) as 'Toplam Ürün Miktarý' from tblIslem where (Tarih between '01.10.2022' and '05.10.2022') 
and TurId=1 and IslemKulId=15

select sum(Miktar) as 'Toplam Ürün Miktarý' from tblIslem 
inner join tblIslemTur on tblIslem.TurId=tblIslemTur.Turid 
inner join tblKullanici on tblKullanici.Kullid=tblIslem.IslemKulId
where (Tarih between '01.10.2022' and '05.10.2022') 
and tblIslemTur.Ad='Giriþ' and tblKullanici.Ad='Oguzhan'
*/
select * from tblKullTur

insert into tblKullanici (KulTurId,Ad,Soyad,Tlf,Mail,Adres,Resim) 
values (3,'Adem','Korkmaz','05322443934','adem@korkmazadem.com','Bandýrma','adem.png')


select * from tblKullanici

--yöneticilerin bilgilerini yazdýrýnýz.

select kt.Ad,k.Ad,k.Soyad,k.Tlf from tblKullanici k inner join tblKullTur kt
on k.KulTurId=kt.id where kt.Ad='yönetici' 

/*nokta atýþý direkt belli olan kiþinin parametresini günceller*/
update tblKullanici set KulTurId=3 where Kullid=7

/*kullId bilinmiyorsa, ismi belli olan kiþi veya kiþileri günceller*/
update tblKullanici set KulTurId=3 where Ad='Enes'

/*belli parametreler göre aranýp bulunan kiþinin deðerlerini güncelleme*/
select Ad,Soyad,Tlf from tblKullanici WHERE Ad='Enes'

update tblKullanici set KulTurId=2 where Kullid in 
(select Kullid from tblKullanici WHERE Ad='Enes')

/*ürünlere ait cinsiyet kategorilerinin giriþi*/
insert into tblUrunSex (Adi,Detay,Resim) 
values ('Unisex','Hem kadýn hemde erkeklere ait ürünler','unisexurunkategori.jpg')

select * from tblBeden

--Depodaki ürünlerin fiyat ortalamasýný veren sorguyu yazýnýz?

select AVG(Fiyat) as ortalama from tblUrunler

--Depodaki ürünlerin fiyat ortalamasýný veren sorguyu AVG parametresi kullanmadan yazýnýz?

select sum (u.Fiyat) from tblUrunler u
select count(u.Fiyat) from tblUrunler u

select (sum(Fiyat)/count(*)) from tblUrunler

--En yüksek Fiyat ile en düþük fiyatýn toplamýný toplam ürün sayýsýna bölen sorguyu yazýnýz.

select max(Fiyat) from tblUrunler
select min(Fiyat) from tblUrunler

select ((max(Fiyat)+min(Fiyat))/count(*)) from tblUrunler

--En yüksek Fiyat ile en düþük fiyatýn ortalamasý için

select (max(Fiyat)+min(fiyat))/2 from tblUrunler 

--en yüksek fiyatlý ürün/ürünlerin bulunduðu kategorinin adýný listeleyen sorguyu yazýnýz?

select u.Adi,k.KategoriAdi,u.Fiyat from tblUrunler u inner join tblCins c
on u.UrunCinsId=c.CinsId inner join tblKategori k
on k.KatId=c.KatId where u.Fiyat in(select max(Fiyat) from tblUrunler)

-- hangi cins türünde kaç tane ürün olduðunu listeleyen sorguyu yazýnýz?

select c.Adi,COUNT(*) from tblUrunler u inner join tblCins c
on u.UrunCinsId=c.CinsId group by c.Adi

--kategorilerde kaç çeþit ürün oldðunu listeyen sorguyu yazýnýz?

select k.KategoriAdi,count(*) from tblKategori k inner join tblCins c
on k.KatId=c.KatId inner join tblUrunler u
on u.UrunCinsId=c.CinsId group by k.KategoriAdi


--tekli güncelleme
--UPDATE tblUrunler SET Stok =  (SELECT Miktar FROM tblIslem WHERE TurId = 1 and UrunId=2) WHERE tblUrunler.UrunId = 2

--- çoklu güncelleme
--update tblUrunler set Stok=Stok+{1} where UrunId={0} (select UrunId,Miktar from tblIslem where TurId=1 )

 -- giriþ iþlemi yapan müþterilerim bilgileri 

select * from tblIslem
select * from tblIslemTur

select * from tblKullanici where Kullid in 
(select IslemKulId from tblIslem where TurId=1)

select * from tblKullanici where 
exists (select * from tblIslem where TurId=1 and tblKullanici.Kullid=tblIslem.IslemKulId)

--iþlem yapmayan 
select * from tblKullanici where 
not exists (select * from tblIslem where TurId=1 and tblKullanici.Kullid=tblIslem.IslemKulId)

-- en fazla ürün griþi gerçekleþtirren kiþi yi bulan sorguyu yazýnýz?
select top 1 IslemKulId, tblKullanici.Ad, SUM(Miktar) as toplamGiris from tblIslem 
inner join tblKullanici on tblIslem.IslemKulId=tblKullanici.Kullid 
where TurId in (select Turid from tblIslemTur where Ad='Giriþ') group by IslemKulId, tblKullanici.Ad order by toplamGiris desc

--35 37 numara ayakkabýlarý getirsin
select * from tblUrunler 
inner join tblBeden on tblUrunler.UrunBedenId=tblBeden.Id
inner join tblUrunSex on tblUrunler.UrunSexId=tblUrunSex.UrunSexId
where tblUrunler.UrunCinsId=1 and tblUrunSex.UrunSexId=1 and
tblBeden.Olcu between 35 and 37

