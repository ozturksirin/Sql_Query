use dbDepo

select * from tblKategori
select * from tblCins

select * from tblUrunler

--EN Y�KSEK F�YATLI �R�N BULUNDU�U KATEGOR�N�N ADINI L�STELEYEN SORGUYU YAZINIZ
					--�r�nler				--tblkategori

select * from tblUrunler
select * from tblKategori

select max(u.Fiyat) from tblUrunler u 


select u.Adi,u.Fiyat from tblUrunler u inner join tblCins c
on u.UrunCinsId=c.CinsId inner join tblKategori k
on c.KatId=k.KatId where Fiyat in (select max(Fiyat) from tblUrunler) 

--HANG� C�NS T�R�NDE KA� TANE �R�N OLDU�UNU L�STELEYEN SORGUYU YAZINIZ?

select *from tblUrunler

select * from tblCins

select * from tblIslem

--select i.Miktar,c.Adi from tblCins c inner join tblUrunler u
--on c.CinsId=u.UrunCinsId inner join tblIslem i
--on u.UrunId=i.UrunId 

select count(*) as tane ,c.Adi from tblUrunler u inner join tblCins c 
on u.UrunCinsId=c.CinsId group by c.Adi

--kategorilerde ka� �e�it �r�n oldu�unu listeleyen sorguyu yaz�n�z ?

select * from tblKategori
select * from tblUrunler


select count(*),k.KategoriAdi from tblKategori k inner join tblCins c
on k.KatId=c.KatId inner join tblUrunler u
on c.CinsId=u.UrunCinsId group by k.KategoriAdi

--ka� cins oldu�u hesaplayal�m
select * from tblCins
select count(*),k.KategoriAdi from tblKategori k inner join tblCins c
on k.KatId=c.KatId group by k.KategoriAdi

--i�lem tablosundaki �r�n miktar�n� i�lem t�r�ne ba�l� olarak giri� ise �r�nler tablosundaki stok kolonuna eklenicek ��k�� ise silinecek.

update tblUrunler SET Stok =(SELECT Miktar from tblIslem where TurId=1 and UrunId=2) where tblUrunler.UrunId=2

select * from tblUrunler




