--Final çalýþma 1

--soru1- Dilek'in eklediði ürünlerden toplam kaç tane satýlmýþ ve kazanç ortalamasý nedir?

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

-- soru2 10.10.2022 tarihinde satýlan kadýn üst giyim ürünlerinin toplam miktarý ve fiyatý

select * from tblIslemTur
select * from tblKategori

select * from tblIslem i
inner join tblKullanici k on i.IslemKulId=k.Kullid 
inner join tblKullTur kt on k.KulTurId=kt.id

inner join tblUrunler u on i.UrunId=u.UrunId
inner join tblUrunSex s on s.UrunSexId=u.UrunSexId

where TurId=2 and Tarih='10/10/2022' and  u.UrunSexId=1

--yonetici olan kullanýcýlar ?
select * from tblKullanici k inner join tblKullTur kt
on k.KulTurId=kt.id  where kt.Ad= 'Yönetici'

-- soru (2) 10.10.2022 tarihinde satýlan kadýn üst giyim ürünlerinin toplam miktarý ve fiyatý
select * from tblIslemTur
select * from tblUrunler
select * from tblUrunSex

select *  from tblUrunler u inner join tblIslem i
on u.UrunId=i.UrunId inner join tblIslemTur it
on i.TurId=it.Turid where i.Tarih='10/10/2022' and u.UrunSexId=1 and it.Turid=2

-- ayakkabý numarasý 36 olup satýlan kadýn ayakkablarý nelerdir ?
select u.Adi,u.Fiyat from tblUrunler u inner join tblIslem i
on u.UrunId=i.UrunId inner join tblIslemTur it 
on i.TurId=it.Turid inner join tblBeden b 
on u.UrunBedenId=b.Id inner join tblUrunSex us 
on u.UrunSexId=us.UrunSexId where us.UrunSexId=1 and b.Olcu='36' and it.Turid=2


--Hangi ürünün hangi bedeni en çok satýlmýþ?

select b.Olcu,count(*) as satis_adeti from tblUrunler u  inner join tblBeden b 
on u.UrunBedenId=b.Id 
group by b.Olcu order by satis_adeti

--Günlük ciro ne kadar?

select DAY(i.Tarih) as Gun, sum(u.Fiyat*i.Miktar) from tblUrunler u inner join tblIslem i
on u.UrunId=i.UrunId inner join tblIslemTur it
on i.TurId=it.Turid where it.Turid=2 group by DAY(i.Tarih)

--Aylýk Ciro
select month(i.Tarih) as ay, sum(u.Fiyat*i.Miktar) from tblUrunler u inner join tblIslem i
on u.UrunId=i.UrunId inner join tblIslemTur it
on i.TurId=it.Turid where it.Turid=2 group by month(i.Tarih)

--Hangi cinsiyet ürünlere raðbet yüksek?

select u.UrunSexId,COUNT(*) as satis_adeti from tblUrunler u inner join tblIslem i
on u.UrunId=i.UrunId inner join tblIslemTur it
on i.TurId=it.Turid where it.Turid=2 group by u.UrunSexId

select * from tblIslemTur
--Veri tabanýndaki kullanýcýlarýn en az giriþ yaptýðý kategoriyi listeleyen sorguyu yazýnýz.
select  COUNT(*) as Adet,k.KategoriAdi as kategoriAdi from tblIslemTur it inner join tblIslem i
on it.Turid=i.TurId inner join tblUrunler u 
on i.UrunId=u.UrunId inner join tblCins c
on u.UrunCinsId=c.CinsId inner join tblKategori k
on c.KatId=k.KatId where it.Turid=1 group by KategoriAdi order by Adet asc

select  KategoriAdi, COUNT(*) as Adet from tblUrunler inner join tblCins 
on tblUrunler.UrunCinsId=tblCins.CinsId inner join tblKategori 
on tblKategori.KatId=tblCins.KatId group by KategoriAdi order by Adet asc

--rastgele 3 ürün
select top 3 * from tblUrunler inner join tblCins on tblUrunler.UrunCinsId=tblCins.CinsId
inner join tblKategori on tblKategori.KatId=tblCins.KatId order by NEWID()

--Veri tabanýndaki her ketgorideki ürünlerin fiyatlarýnýn toplamý

select KategoriAdi,SUM(Fiyat) as Total_fiyat from tblUrunler u inner join tblCins c
on u.UrunCinsId=c.CinsId inner join tblKategori k
on c.KatId=k.KatId  group by k.KategoriAdi

--depodaki mevcut ürünlerin fiyatýnýn toplamý

select * from tblUrunler u  where u.Stok>0
select SUM(Fiyat*Stok) from tblUrunler u  where u.Stok>0

--Veri tabanýndaki unisex ürünlerin içerisinde sayýsý olan ürünü listeleyiniz.
select us.Adi, count(*)  as adet from  tblUrunler u inner join tblUrunSex us 
on u.UrunSexId=us.UrunSexId group by us.Adi

--Soru 2) Veri tabanýndaki unisex ürünlerin içerisinde en çok stoku olan ürünü listeleyiniz.

select us.Adi, SUM(Stok)  as adet from  tblUrunler u inner join tblUrunSex us 
on u.UrunSexId=us.UrunSexId   group by us.Adi 

--Aralýk ayýnýn haftalýk ve günlük net kazanç ne kadar?

select DAY(Tarih) as gün ,sum(Miktar*Fiyat) from tblUrunler u inner join tblIslem i
on u.UrunId=i.UrunId inner join tblIslemTur it 
on i.TurId=it.Turid where Turid=2 and MONTH(Tarih)=12 group by DAY(Tarih)

--12 aylýk günlük ortlama net kazanç ne kadar
select day(Tarih) as Gün, SUM(Miktar*Fiyat) as GünlükTopKazanc  from tblIslem 
inner join tblUrunler on tblUrunler.UrunId=tblIslem.UrunId
 group by day(Tarih) 

 
--Soru 2) 12 ayýnýn h  günlük ortlama net kazanç ne kadar?
select day(Tarih) as Gün, avg(Miktar*Fiyat) as GünlükOrtKazanc  from tblIslem 
inner join tblUrunler on tblUrunler.UrunId=tblIslem.UrunId
 group by day(Tarih)

--Soru 1) Ürün cinsi gömlek ve bedeni L olan aç ürün satýklmýþtýr?

select * from tblUrunler u inner join tblCins c 
on u.UrunCinsId =c.CinsId inner join tblBeden b
on u.UrunBedenId=b.Id where c.Adi='Gömlek' and b.Olcu='L'


-- FÝNAL CALÝSMA 2

-- Dilek'in eklediði ürünlerden toplam kaç tane satýlmýþ ve kazanç ortalamasý nedir?

select SUM(Miktar*Fiyat) from tblUrunler u inner join tblIslem i
on u.UrunId= i.UrunId where TurId=2 and i.UrunId in 

(select UrunId from tblIslem i 
inner join tblKullanici k
on i.IslemKulId=i.PersonelKulId where k.Ad ='Dilek')

--2 10.10.2022 tarihinde satýlan kadýn üst giyim ürünlerinin toplam miktarý ve fiyatý

select * from tblUrunler u inner join tblIslem i
on u.UrunId=i.UrunId inner join tblUrunSex us
on u.UrunSexId=us.UrunSexId 
where Tarih ='10/10/2022' and us.Adi='Kadýn' and i.TurId=2

--soru 3 ayakkabý numarasý 40 olup satýlan kadýn ayakkablarý 

--Soru 2) Veri tabanýndaki unisex ürünlerin içerisinde en çok stoku olan ürünü listeleyiniz.



