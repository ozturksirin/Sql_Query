-- 14.12.2022 tarihli iþlemler

use dbDepo

--Soru 1) Hangi ürünün hangi bedeni en çok satýlmýþ?
select tblBeden.Olcu, COUNT(*) as satisAdeti from tblIslem 
inner join tblUrunler on tblUrunler.UrunId = tblIslem.UrunId
inner join tblBeden on tblBeden.Id = tblUrunler.UrunBedenId
group by tblBeden.Olcu order by satisAdeti desc

--Soru 2) Günlük ciro ne kadar?
--Toplam Ciro
select SUM(tblIslem.Miktar * tblUrunler.Fiyat) as toplamCiro from tblIslem 
inner join tblUrunler on tblUrunler.UrunId = tblIslem.UrunId
where tblIslem.TurId = 2 
--Günlük Ciro
select day(tblIslem.Tarih) as Gün,SUM(tblIslem.Miktar * tblUrunler.Fiyat) as GünlükCiro from tblIslem 
inner join tblUrunler on tblUrunler.UrunId = tblIslem.UrunId
where tblIslem.TurId = 2 group by day(tblIslem.Tarih)
--Aylýk Ciro
select month(tblIslem.Tarih) as Ay ,SUM(tblIslem.Miktar * tblUrunler.Fiyat) as AylikCiro from tblIslem 
inner join tblUrunler on tblUrunler.UrunId = tblIslem.UrunId
where tblIslem.TurId = 2 group by month(tblIslem.Tarih)

--Soru 1) Hangi cinsiyet ürünlere raðbet yüksek?
select tblUrunSex.Adi, COUNT(*) as satisAdeti from tblIslem 
inner join tblUrunler on tblUrunler.UrunId = tblIslem.UrunId
inner join tblUrunSex on tblUrunSex.UrunSexId = tblUrunler.UrunSexId 
where tblIslem.TurId = 2
group by tblUrunSex.Adi order by satisAdeti desc

select tblUrunSex.Adi, COUNT(*) as alisAdeti from tblIslem 
inner join tblUrunler on tblUrunler.UrunId = tblIslem.UrunId
inner join tblUrunSex on tblUrunSex.UrunSexId = tblUrunler.UrunSexId 
where tblIslem.TurId = 1
group by tblUrunSex.Adi order by alisAdeti desc

select tblUrunSex.Adi, SUM(Miktar) as satisAdeti from tblIslem 
inner join tblUrunler on tblUrunler.UrunId = tblIslem.UrunId
inner join tblUrunSex on tblUrunSex.UrunSexId = tblUrunler.UrunSexId 
where tblIslem.TurId = 2
group by tblUrunSex.Adi order by satisAdeti desc

select tblUrunSex.Adi, SUM(Miktar * Fiyat) as satisAdeti from tblIslem 
inner join tblUrunler on tblUrunler.UrunId = tblIslem.UrunId
inner join tblUrunSex on tblUrunSex.UrunSexId = tblUrunler.UrunSexId 
where tblIslem.TurId = 2
group by tblUrunSex.Adi order by satisAdeti desc


--MÜÞTERÝLER NE ZAMAN ALIÞVERÝÞ YAPMIÞ?

select * from tblIslem



