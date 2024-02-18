use dbDepo

select * from tblKategori
select * from tblCins

select * from tblUrunler

--EN YÜKSEK FÝYATLI ÜRÜN BULUNDUÐU KATEGORÝNÝN ADINI LÝSTELEYEN SORGUYU YAZINIZ
					--ürünler				--tblkategori

select * from tblUrunler
select * from tblKategori

select max(u.Fiyat) from tblUrunler u 


select u.Adi,u.Fiyat from tblUrunler u inner join tblCins c
on u.UrunCinsId=c.CinsId inner join tblKategori k
on c.KatId=k.KatId where Fiyat in (select max(Fiyat) from tblUrunler) 

--HANGÝ CÝNS TÜRÜNDE KAÇ TANE ÜRÜN OLDUÐUNU LÝSTELEYEN SORGUYU YAZINIZ?

select *from tblUrunler

select * from tblCins

select * from tblIslem

--select i.Miktar,c.Adi from tblCins c inner join tblUrunler u
--on c.CinsId=u.UrunCinsId inner join tblIslem i
--on u.UrunId=i.UrunId 

select count(*) as tane ,c.Adi from tblUrunler u inner join tblCins c 
on u.UrunCinsId=c.CinsId group by c.Adi

--kategorilerde kaç çeþit ürün olduðunu listeleyen sorguyu yazýnýz ?

select * from tblKategori
select * from tblUrunler


select count(*),k.KategoriAdi from tblKategori k inner join tblCins c
on k.KatId=c.KatId inner join tblUrunler u
on c.CinsId=u.UrunCinsId group by k.KategoriAdi

--kaç cins olduðu hesaplayalým
select * from tblCins
select count(*),k.KategoriAdi from tblKategori k inner join tblCins c
on k.KatId=c.KatId group by k.KategoriAdi

--iþlem tablosundaki ürün miktarýný iþlem türüne baðlý olarak giriþ ise ürünler tablosundaki stok kolonuna eklenicek çýkýþ ise silinecek.

update tblUrunler SET Stok =(SELECT Miktar from tblIslem where TurId=1 and UrunId=2) where tblUrunler.UrunId=2

select * from tblUrunler




