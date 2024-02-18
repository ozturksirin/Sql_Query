--Final �al��ma 1

--soru1- Dilek'in ekledi�i �r�nlerden toplam ka� tane sat�lm�� ve kazan� ortalamas� nedir?

select * from tblIslemTur
select * from tblUrunler where UrunId=10
	select  SUM(Miktar) from tblIslem 
	where TurId=2 and UrunId in (select UrunId from tblIslem 
	inner join tblKullanici on tblKullanici.Kullid=tblIslem.PersonelKulId	
	where tblKullanici.Ad='Dilek' )

	select  SUM(Miktar*Fiyat) from tblIslem 
	inner join tblUrunler on tblUrunler.UrunId=tblIslem.UrunId
	where TurId=2 and tblIslem.UrunId in (select UrunId from tblIslem 
	inner join tblKullanici on tblKullanici.Kullid=tblIslem.PersonelKulId	
	where tblKullanici.Ad='Dilek' )

	select * from tblIslem where UrunId=10 and TurId=2

-- soru2 10.10.2022 tarihinde sat�lan kad�n �st giyim �r�nlerinin toplam miktar� ve fiyat�

select * from tblIslemTur
select * from tblKategori

select * from tblIslem i
inner join tblKullanici k on i.IslemKulId=k.Kullid 
inner join tblKullTur kt on k.KulTurId=kt.id

inner join tblUrunler u on i.UrunId=u.UrunId
inner join tblUrunSex s on s.UrunSexId=u.UrunSexId

where TurId=2 and Tarih='10/10/2022' and  u.UrunSexId=1

--yonetici olan kullan�c�lar ?
select * from tblKullanici k inner join tblKullTur kt
on k.KulTurId=kt.id  where kt.Ad= 'Y�netici'

-- soru (2) 10.10.2022 tarihinde sat�lan kad�n �st giyim �r�nlerinin toplam miktar� ve fiyat�
select * from tblIslemTur
select * from tblUrunler
select * from tblUrunSex

select *  from tblUrunler u inner join tblIslem i
on u.UrunId=i.UrunId inner join tblIslemTur it
on i.TurId=it.Turid where i.Tarih='10/10/2022' and u.UrunSexId=1 and it.Turid=2

-- ayakkab� numaras� 36 olup sat�lan kad�n ayakkablar� nelerdir ?
select u.Adi,u.Fiyat from tblUrunler u inner join tblIslem i
on u.UrunId=i.UrunId inner join tblIslemTur it 
on i.TurId=it.Turid inner join tblBeden b 
on u.UrunBedenId=b.Id inner join tblUrunSex us 
on u.UrunSexId=us.UrunSexId where us.UrunSexId=1 and b.Olcu='36' and it.Turid=2


--Hangi �r�n�n hangi bedeni en �ok sat�lm��?

select b.Olcu,count(*) as satis_adeti from tblUrunler u  inner join tblBeden b 
on u.UrunBedenId=b.Id 
group by b.Olcu order by satis_adeti

--G�nl�k ciro ne kadar?

select DAY(i.Tarih) as Gun, sum(u.Fiyat*i.Miktar) from tblUrunler u inner join tblIslem i
on u.UrunId=i.UrunId inner join tblIslemTur it
on i.TurId=it.Turid where it.Turid=2 group by DAY(i.Tarih)

--Ayl�k Ciro
select month(i.Tarih) as ay, sum(u.Fiyat*i.Miktar) from tblUrunler u inner join tblIslem i
on u.UrunId=i.UrunId inner join tblIslemTur it
on i.TurId=it.Turid where it.Turid=2 group by month(i.Tarih)

--Hangi cinsiyet �r�nlere ra�bet y�ksek?

select u.UrunSexId,COUNT(*) as satis_adeti from tblUrunler u inner join tblIslem i
on u.UrunId=i.UrunId inner join tblIslemTur it
on i.TurId=it.Turid where it.Turid=2 group by u.UrunSexId

select * from tblIslemTur
--Veri taban�ndaki kullan�c�lar�n en az giri� yapt��� kategoriyi listeleyen sorguyu yaz�n�z.
select  COUNT(*) as Adet,k.KategoriAdi as kategoriAdi from tblIslemTur it inner join tblIslem i
on it.Turid=i.TurId inner join tblUrunler u 
on i.UrunId=u.UrunId inner join tblCins c
on u.UrunCinsId=c.CinsId inner join tblKategori k
on c.KatId=k.KatId where it.Turid=1 group by KategoriAdi order by Adet asc

select  KategoriAdi, COUNT(*) as Adet from tblUrunler inner join tblCins 
on tblUrunler.UrunCinsId=tblCins.CinsId inner join tblKategori 
on tblKategori.KatId=tblCins.KatId group by KategoriAdi order by Adet asc

--rastgele 3 �r�n
select top 3 * from tblUrunler inner join tblCins on tblUrunler.UrunCinsId=tblCins.CinsId
inner join tblKategori on tblKategori.KatId=tblCins.KatId order by NEWID()

--Veri taban�ndaki her ketgorideki �r�nlerin fiyatlar�n�n toplam�

select KategoriAdi,SUM(Fiyat) as Total_fiyat from tblUrunler u inner join tblCins c
on u.UrunCinsId=c.CinsId inner join tblKategori k
on c.KatId=k.KatId  group by k.KategoriAdi

--depodaki mevcut �r�nlerin fiyat�n�n toplam�

select * from tblUrunler u  where u.Stok>0
select SUM(Fiyat*Stok) from tblUrunler u  where u.Stok>0

--Veri taban�ndaki unisex �r�nlerin i�erisinde say�s� olan �r�n� listeleyiniz.
select us.Adi, count(*)  as adet from  tblUrunler u inner join tblUrunSex us 
on u.UrunSexId=us.UrunSexId group by us.Adi

--Soru 2) Veri taban�ndaki unisex �r�nlerin i�erisinde en �ok stoku olan �r�n� listeleyiniz.

select us.Adi, SUM(Stok)  as adet from  tblUrunler u inner join tblUrunSex us 
on u.UrunSexId=us.UrunSexId   group by us.Adi 

--Aral�k ay�n�n haftal�k ve g�nl�k net kazan� ne kadar?

select DAY(Tarih) as g�n ,sum(Miktar*Fiyat) from tblUrunler u inner join tblIslem i
on u.UrunId=i.UrunId inner join tblIslemTur it 
on i.TurId=it.Turid where Turid=2 and MONTH(Tarih)=12 group by DAY(Tarih)

--12 ayl�k g�nl�k ortlama net kazan� ne kadar
select day(Tarih) as G�n, SUM(Miktar*Fiyat) as G�nl�kTopKazanc  from tblIslem 
inner join tblUrunler on tblUrunler.UrunId=tblIslem.UrunId
 group by day(Tarih) 

 
--Soru 2) 12 ay�n�n h  g�nl�k ortlama net kazan� ne kadar?
select day(Tarih) as G�n, avg(Miktar*Fiyat) as G�nl�kOrtKazanc  from tblIslem 
inner join tblUrunler on tblUrunler.UrunId=tblIslem.UrunId
 group by day(Tarih)

--Soru 1) �r�n cinsi g�mlek ve bedeni L olan a� �r�n sat�klm��t�r?

select * from tblUrunler u inner join tblCins c 
on u.UrunCinsId =c.CinsId inner join tblBeden b
on u.UrunBedenId=b.Id where c.Adi='G�mlek' and b.Olcu='L'


-- F�NAL CAL�SMA 2

-- Dilek'in ekledi�i �r�nlerden toplam ka� tane sat�lm�� ve kazan� ortalamas� nedir?

select SUM(Miktar*Fiyat) from tblUrunler u inner join tblIslem i
on u.UrunId= i.UrunId where TurId=2 and i.UrunId in 

(select UrunId from tblIslem i 
inner join tblKullanici k
on i.IslemKulId=i.PersonelKulId where k.Ad ='Dilek')

--2 10.10.2022 tarihinde sat�lan kad�n �st giyim �r�nlerinin toplam miktar� ve fiyat�

select * from tblUrunler u inner join tblIslem i
on u.UrunId=i.UrunId inner join tblUrunSex us
on u.UrunSexId=us.UrunSexId 
where Tarih ='10/10/2022' and us.Adi='Kad�n' and i.TurId=2

--soru 3 ayakkab� numaras� 40 olup sat�lan kad�n ayakkablar� 

--Soru 2) Veri taban�ndaki unisex �r�nlerin i�erisinde en �ok stoku olan �r�n� listeleyiniz.



