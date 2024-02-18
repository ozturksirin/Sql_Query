-- 14.12.2022 tarihli i�lemler

use dbDepo

--Soru 1) Hangi �r�n�n hangi bedeni en �ok sat�lm��?
select tblBeden.Olcu, COUNT(*) as satisAdeti from tblIslem 
inner join tblUrunler on tblUrunler.UrunId = tblIslem.UrunId
inner join tblBeden on tblBeden.Id = tblUrunler.UrunBedenId
group by tblBeden.Olcu order by satisAdeti desc

--Soru 2) G�nl�k ciro ne kadar?
--Toplam Ciro
select SUM(tblIslem.Miktar * tblUrunler.Fiyat) as toplamCiro from tblIslem 
inner join tblUrunler on tblUrunler.UrunId = tblIslem.UrunId
where tblIslem.TurId = 2 
--G�nl�k Ciro
select day(tblIslem.Tarih) as G�n,SUM(tblIslem.Miktar * tblUrunler.Fiyat) as G�nl�kCiro from tblIslem 
inner join tblUrunler on tblUrunler.UrunId = tblIslem.UrunId
where tblIslem.TurId = 2 group by day(tblIslem.Tarih)
--Ayl�k Ciro
select month(tblIslem.Tarih) as Ay ,SUM(tblIslem.Miktar * tblUrunler.Fiyat) as AylikCiro from tblIslem 
inner join tblUrunler on tblUrunler.UrunId = tblIslem.UrunId
where tblIslem.TurId = 2 group by month(tblIslem.Tarih)

--Soru 1) Hangi cinsiyet �r�nlere ra�bet y�ksek?
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


--M��TER�LER NE ZAMAN ALI�VER�� YAPMI�?

select * from tblIslem



