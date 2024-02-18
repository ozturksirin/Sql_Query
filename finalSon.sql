use dbDepo

alter table tblUrunler add Stok int not null

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

select sum(tblIslem.Miktar) as 'Toplam Ürün Miktarý' from tblIslem 
inner join tblIslemTur on tblIslem.TurId=tblIslemTur.Turid
inner join tblKullanici on tblIslem.IslemKulId=tblKullanici.Kullid
where (Tarih between '01.10.2022' and '05.10.2022') and tblIslemTur.Ad='Giriþ' and tblKullanici.Ad='Oguzhan'

use dbDepo

insert into tblKullTur (Ad) values ('Yönetici')

select * from tblKullTur

insert into tblKullanici (KulTurId,Ad,Soyad,Tlf,Mail,Adres,Resim) 
values (3,'Adem','Korkmaz','05322443934','adem@korkmazadem.com','Bandýrma','adem.png')
insert into tblKullanici (KulTurId,Ad,Soyad,Tlf,Mail,Adres,Resim)
values(1,'Dilek','Uðuzlu','05366548693','uguzludilek@gmail.com','Kocaeli','Dilek.png')

select * from tblKullanici

select tblKullanici.Kullid, tblKullTur.Ad,tblKullanici.Ad,tblKullanici.Soyad,tblKullanici.Tlf from tblKullanici 
inner join tblKullTur on tblKullanici.KulTurId=tblKullTur.id where tblKullTur.Ad='Yönetici'

/*nokta atýþý direkt belli olan kiþinin parametresini günceller*/
update tblKullanici set KulTurId=3 where Kullid=7
select * from tblKullanici
/*kullId bilinmiyorsa, ismi belli olna kiþi veya kiþileri günceller*/

update tblKullanici set KulTurId=3 where Ad='Enes'

/*belli parametreler göre aranýp bulunan kiþinin deðerlerini güncelleme*/
select Ad,Soyad,Tlf from tblKullanici WHERE Ad='Enes'

update tblKullanici set KulTurId=2 where Kullid in 
(select Kullid from tblKullanici WHERE Ad='Enes')

select * from tblKullanici

/*ürünlere ait cinsiyet kategorilerinin giriþi*/
insert into tblUrunSex (Adi,Detay,Resim) 
values ('Unisex','Hem kadýn hemde erkeklere ait ürünler','unisexurunkategori.jpg')

select * from tblUrunSex

/*iþlem türlerinin belirlenmesi*/
insert into tblIslemTur(Ad,Detay) 
values ('Ýmha','Depodaki ürünlerin stoktan çýkýþsýz düþme iþlemi')

select * from tblIslemTur

/*Ürünlere ait kategorilerin tanýmlanmasý*/
insert into tblKategori (KategoriAdi,Resim,KategoriDetay) 
values ('Dýþ Giyim','disgiyim.jpg','Kadýn,erkek ve unisex e ait dýþ giyim türleri')

select * from tblKategori

/*ürünlere ait cins türlerinin belirlenmesi*/
insert into tblCins (KatId,Adi,Resim,Detay) 
values (1,'Spor','spor.jpg','Her cinsiyete ait spor ayakkabý türleri')

insert into tblCins(KatId,Adi,Resim,Detay)
values(1,'Bot','bot.jpg','Her cinsiyete ait bot türleri')
insert into tblCins(KatId,Adi,Resim,Detay)
values(1,'Çizme','çizme.jpg','Her cinsiyete ait çizme türleri')
insert into tblCins(KatId,Adi,Resim,Detay)
values(1,'Babet','babet.jpg','Her cinsiyete ait babet türleri')
insert into tblCins(KatId,Adi,Resim,Detay)
values(1,'Topuklu','topuklu.jpg','Her cinsiyete ait topuklu türleri')
insert into tblCins(KatId,Adi,Resim,Detay)
values(1,'Sandalet','sandalet.jpg','Her cinsiyete ait sandalet türleri')
insert into tblCins(KatId,Adi,Resim,Detay)
values(1,'Terlik','terlik.jpg','Her cinsiyete ait terlik türleri')

select * from tblKategori

insert into tblCins (KatId,Adi,Resim,Detay)
values(2,'Sweatshirt','Sweatshirt.jpg','Her cinsiyete ait sweatshirt türleri')
insert into tblCins (KatId,Adi,Resim,Detay)
values(2,'Hoodie','Hoodie.jpg','Her cinsiyete ait hoodie türleri')
insert into tblCins (KatId,Adi,Resim,Detay)
values(2,'Gömlek','Gömlek.jpg','Her cinsiyete ait gömlek türleri')
insert into tblCins (KatId,Adi,Resim,Detay)
values(2,'Kazak','Kazak.jpg','Her cinsiyete ait kazak türleri')
insert into tblCins (KatId,Adi,Resim,Detay)
values(2,'T-shirt','tshirt.jpg','Her cinsiyete ait T-shirt türleri')
insert into tblCins (KatId,Adi,Resim,Detay)
values(2,'Crop','crop.jpg','Her cinsiyete ait Crop türleri')

insert into tblCins(KatId,Adi,Resim,Detay)
values(3,'Kot Pantolon','kotpantolon.jpg','her cinsiyete ait kot pantolon türleri')
insert into tblCins(KatId,Adi,Resim,Detay)
values(3,'Kumaþ Pantolon','kumaþpantolon.jpg','her cinsiyete ait kot pantolon türleri')
insert into tblCins(KatId,Adi,Resim,Detay)
values(3,'Kot Þort','kotsort.jpg','her cinsiyete ait kot þort türleri')
insert into tblCins(KatId,Adi,Resim,Detay)
values(3,'Tayt','tayt.jpg','her cinsiyete ait tayt türleri')
insert into tblCins(KatId,Adi,Resim,Detay)
values(3,'Deniz Þortu','denizsortu.jpg','her cinsiyete ait deniz þortu türleri')
insert into tblCins(KatId,Adi,Resim,Detay)
values(3,'Kapri','kapri.jpg','her cinsiyete ait kapri türleri')
insert into tblCins(KatId,Adi,Resim,Detay)
values(3,'Kalem Etek','kalemetek.jpg','her cinsiyete ait kalem etek türleri')
insert into tblCins(KatId,Adi,Resim,Detay)
values(3,'Eþofman','esofman.jpg','her cinsiyete ait eþofman türleri')
insert into tblCins(KatId,Adi,Resim,Detay)
values(3,'Þalvar','salvar.jpg','her cinsiyete ait þalvar türleri')

insert into tblCins (KatId,Adi,Resim,Detay)
values (4,'Külot','Külot.jpg','Her cinsiyete ait Külot türleri')
insert into tblCins (KatId,Adi,Resim,Detay)
values (4,'Ýçlik','Ýçlik.jpg','Her cinsiyete ait Ýçlik türleri')
insert into tblCins (KatId,Adi,Resim,Detay)
values (4,'Atlet','Atlet.jpg','Her cinsiyete ait Atlet türleri')
insert into tblCins (KatId,Adi,Resim,Detay)
values (4,'Gecelik','Gecelik.jpg','Her cinsiyete ait Gecelik türleri')
insert into tblCins (KatId,Adi,Resim,Detay)
values (4,'Korse','Korse.jpg','Her cinsiyete ait Korse türleri')
insert into tblCins (KatId,Adi,Resim,Detay)
values (4,'Boxer','Boxer.jpg','Her cinsiyete ait Boxer türleri')
insert into tblCins (KatId,Adi,Resim,Detay)
values (4,'Sütyen','Sütyen.jpg','Kadýnlara ait sütyen türleri')
insert into tblCins (KatId,Adi,Resim,Detay)
values (4,'Büstiyer','Büstiyer.jpg','Kadýnlara ait büstiyer türleri')
insert into tblCins (KatId,Adi,Resim,Detay)
values (4,'Fanila','Fanila.jpg','Her cinsiyete ait Fanila türleri')


insert into tblCins (KatId,Adi,Resim,Detay)
values (5,'Kaban','kaban.jpg','her cinsiyete ait kaban türleri')
insert into tblCins (KatId,Adi,Resim,Detay)
values (5,'Pardösü','pardösü.jpg','her cinsiyete ait pardösü türleri')
insert into tblCins (KatId,Adi,Resim,Detay)
values (5,'Ceket','ceket.jpg','her cinsiyete ait ceket türleri')

select * from tblCins
select * from tblKategori
select * from tblBeden
insert into tblBeden (KatId,Olcu) values (2,'XS')
insert into tblBeden (KatId,Olcu) values (2,'S')
insert into tblBeden (KatId,Olcu) values (2,'M')
insert into tblBeden (KatId,Olcu) values (2,'L')
insert into tblBeden (KatId,Olcu) values (2,'XL')
insert into tblBeden (KatId,Olcu) values (2,'XXL')
insert into tblBeden (KatId,Olcu) values (2,'XXXL')

insert into tblBeden (KatId,Olcu) values (3,'XS')
insert into tblBeden (KatId,Olcu) values (3,'S')
insert into tblBeden (KatId,Olcu) values (3,'M')
insert into tblBeden (KatId,Olcu) values (3,'L')
insert into tblBeden (KatId,Olcu) values (3,'XL')
insert into tblBeden (KatId,Olcu) values (3,'XXL')
insert into tblBeden (KatId,Olcu) values (3,'XXXL')

insert into tblBeden (KatId,Olcu) values (4,'XS')
insert into tblBeden (KatId,Olcu) values (4,'S')
insert into tblBeden (KatId,Olcu) values (4,'M')
insert into tblBeden (KatId,Olcu) values (4,'L')
insert into tblBeden (KatId,Olcu) values (4,'XL')
insert into tblBeden (KatId,Olcu) values (4,'XXL')
insert into tblBeden (KatId,Olcu) values (4,'XXXL')

insert into tblBeden (KatId,Olcu) values (5,'XS')
insert into tblBeden (KatId,Olcu) values (5,'S')
insert into tblBeden (KatId,Olcu) values (5,'M')
insert into tblBeden (KatId,Olcu) values (5,'L')
insert into tblBeden (KatId,Olcu) values (5,'XL')
insert into tblBeden (KatId,Olcu) values (5,'XXL')
insert into tblBeden (KatId,Olcu) values (5,'XXXL')

/*ürün tanýmlama iþlemi*/
select * from tblUrunSex
select * from tblCins
select * from tblBeden

insert into tblUrunler (UrunSexId,UrunCinsId,UrunBedenId,Adi,Resim,Fiyat,Renk,Detay,Stok) values
(1,11,36,'Vatkalý Yarým Balýkçý Fermuarlý','vatkali.jpg','150','Siyah','Yarým balýkçý, fermuarlý.',0)

use dbDepo

alter table tblUrunler ALTER COLUMN Adi varchar(50) not null

select * from tblBeden

select * from tblUrunler
delete from tblUrunler where UrunId=13

select * from tblKategori

insert into tblUrunler(UrunSexId,UrunCinsId,UrunBedenId,Adi,Resim,Fiyat,Renk,Detay,Stok)
 values(3,23,21,'külot','külot.jpg','200' ,'beyaz','dantelli',0)

 insert into tblUrunler(UrunSexId,UrunCinsId,UrunBedenId,Adi,Resim,Fiyat,Renk,Detay,Stok)
 values(3,24,22,'termal içlýk','içlik.jpg','100' ,'Siyah','sýcak tutan',0)

 insert into tblUrunler(UrunSexId,UrunCinsId,UrunBedenId,Adi,Resim,Fiyat,Renk,Detay,Stok)
 values(3,25,25,' pamuklu Atlet','Atlet.jpg','150' ,'beyaz','%pamuk',0)

 insert into tblUrunler(UrunSexId,UrunCinsId,UrunBedenId,Adi,Resim,Fiyat,Renk,Detay,Stok)
 values(1,26,23,'Bondi miral','gecelik.png','500' ,'beyaz','satenli',0)
 
 insert into tblUrunler(UrunSexId,UrunCinsId,UrunBedenId,Adi,Resim,Fiyat,Renk,Detay,Stok)
 values(1,27,34,'korse','korse.jpg','100' ,'Siyah','Bel Ve Göbek Sýkýlaþtýrýcý',0)

 insert into tblUrunler(UrunSexId,UrunCinsId,UrunBedenId,Adi,Resim,Fiyat,Renk,Detay,Stok)
 values(2,28,34,'boxer','boxer.jpg','50' ,'Siyah','kalvin klein boxer',0)

 insert into tblUrunler(UrunSexId,UrunCinsId,UrunBedenId,Adi,Resim,Fiyat,Renk,Detay,Stok)
 values(1,29,34,'sutyen','sutyen.jpg','90','kýrmýzý','dantelli',0)

  insert into tblUrunler(UrunSexId,UrunCinsId,UrunBedenId,Adi,Resim,Fiyat,Renk,Detay,Stok)
 values(1,30,34,'bustier','bustier.jpg','90','siyah','Cop Top Büstiyer',0)

 insert into tblUrunler(UrunSexId,UrunCinsId,UrunBedenId,Adi,Resim,Fiyat,Renk,Detay,Stok)
 values(1,31,34,'fanila','fanila.jpg','100','siyah',' %100 Pamuk Ýp ',0)

 insert into tblUrunler(UrunSexId,UrunCinsId,UrunBedenId,Adi,Resim,Fiyat,Renk,Detay,Stok)
 values(1,32,34,'kaban','kaban.jpg','100','siyah',' %Içi Astarlý Uzun Kaþe Kaban ',0)

 insert into tblUrunler(UrunSexId,UrunCinsId,UrunBedenId,Adi,Resim,Fiyat,Renk,Detay,Stok)
 values(1,33,34,'pardosu','pardosu.jpg','350','siyah',' %100 Pamuk Ýp ',0)

 insert into tblUrunler(UrunSexId,UrunCinsId,UrunBedenId,Adi,Resim,Fiyat,Renk,Detay,Stok)
 values(3,34,34,'ceket','ceket.jpg','100','beyaz',' su gecirmez ',0)

select * from tblUrunler
--Depodaki ürünlerin fiyat ortalamasýný veren sorguyu yazýnýz?
select avg(Fiyat) as ortalama from tblUrunler

--Depodaki ürünlerin fiyat ortalamasýný veren sorguyu AVG parameeresi kullanmadan yazýnýz?
select sum(Fiyat) as toplam from tblUrunler 
select count(*) as UrunSayisi from tblUrunler

select (sum(Fiyat))/(count(*)) as OrtalamaFiyat from tblUrunler 

--Enyüksek Fiyat ile en düþük fiyatýn toplamýný toplam ürün sayýsýna bölen sorguyu yazýnýz
select MAX(Fiyat) from tblUrunler --en yüksek ürün fiyat
select MIN(Fiyat) from tblUrunler  -- en düþük ürün fiyat
select MAX(Fiyat)+MIN(Fiyat) from tblUrunler --en yüksek ürün ile enb düþük ürün fiyatnýn toplamý
select (MAX(Fiyat)+MIN(Fiyat))/COUNT(*) from tblUrunler

--fiyat ortalamasý için
select (MAX(Fiyat)+MIN(Fiyat))/2 from tblUrunler
select * from tblUrunler

--en yüksek fiyatlý ürün/ürünler bulunduðu kategorinin adýný listeleyen sorguyu yazýnýz?
select max(Fiyat) from tblUrunler 
select KategoriAdi from tblKategori

select KategoriAdi,tblUrunler.Adi,tblUrunler.Fiyat from tblUrunler 
inner join tblCins on tblUrunler.UrunCinsId=tblCins.CinsId
inner join tblKategori on tblKategori.KatId=tblCins.KatId
where Fiyat in (select max(Fiyat) from tblUrunler )

--26.10.2022 tarihli çalýþmalar
use dbDepo

select * from tblUrunler
select * from tblKullTur
select * from tblKullanici
-- hangi cins türünde kaç tane ürün olduðunu listeleyen sorguyu yazýnýz?
select tblCins.Adi,COUNT(*) from tblUrunler 
inner join tblCins on tblUrunler.UrunCinsId=tblCins.CinsId
group by tblCins.Adi

--kategorilerde kaç çeþit ürün oldðunu listeyen sorguyu yazýnýz?

select tblKategori.KategoriAdi,COUNT(*) from tblKategori
inner join tblCins on tblKategori.KatId=tblCins.KatId
inner join tblUrunler on tblUrunler.UrunCinsId=tblCins.CinsId
group by tblKategori.KategoriAdi

select * from tblKategori
inner join tblCins on tblKategori.KatId=tblCins.KatId
inner join tblUrunler on tblUrunler.UrunCinsId=tblCins.CinsId
--group by tblKategori.KategoriAdi
select tblKategori.KategoriAdi,COUNT(*) from tblKategori
inner join tblCins on tblKategori.KatId=tblCins.KatId
group by tblKategori.KategoriAdi


 select*from tblIslemTur
  select*from tblIslem
  select * from tblKullanici inner join tblKullTur on tblKullTur.id=tblKullanici.KulTurId
  '10/26/2022'

  insert into tblIslem(TurId,PersonelKulId,IslemKulId,Tarih,Miktar,UrunId) values 
  (1,4,2,'10/13/2022',3,12)
  insert into tblIslem(TurId,PersonelKulId,IslemKulId,Tarih,Miktar,UrunId) values
(1,4,8,'11/11/2022',3,10)
   select * from tblIslem
   INSERT INTO tblIslem (TurId,PersonelKulId,IslemKulId,Tarih,Miktar,UrunId)
VALUES (2,4,6,'10/26/2022',3,11)

insert into tblIslem(TurId,PersonelKulId,IslemKulId,Tarih,Miktar,UrunId) values
(2,4,4,'12/12/2022',101,24)

SELECT * FROM tblUrunler
select * from tblIslem inner join tblIslemTur on tblIslemTur.Turid=tblIslem.TurId
insert into tblIslem(TurId,PersonelKulId,IslemKulId,Tarih,Miktar,UrunId) values (1,11,2,'09/10/2023',50,120)

--02.11.2022 tarihli iþlemler
use dbDepo

select tblKullanici.Ad,tblKullanici.Soyad,tblKullTur.Ad,tblIslem.Tarih,
tblIslem.Miktar,tblIslem.UrunId,tblUrunler.Adi from tblIslem 
inner join tblKullanici on tblIslem.PersonelKulId = tblKullanici.Kullid
inner join tblKullTur on tblKullTur.id = tblKullanici.KulTurId
inner join tblUrunler on tblUrunler.UrunId = tblIslem.UrunId

select * from tblIslemTur


UPDATE tblUrunler as urun,
      (select UrunId,Miktar from tblIslem where TurId=1) AS T2 
  SET urun.Stok=urun.Stok + T2.Miktar
WHERE urun.UrunId = T2.UrunId;

--tekli güncelleme
UPDATE tblUrunler SET Stok =  (SELECT Miktar FROM tblIslem WHERE TurId = 1 and UrunId=2) WHERE tblUrunler.UrunId = 2

--- çoklu güncelleme
update tblUrunler set Stok=Stok+{1} where UrunId={0} (select UrunId,Miktar from tblIslem where TurId=1 )

UPDATE tblUrunler SET Stok = Stok + (SELECT Miktar FROM tblIslem WHERE TurId = 1) 
WHERE tblUrunler.UrunId = (SELECT UrunId FROM tblIslem WHERE TurId = 1)


select UrunId,COUNT(*) from tblIslem group by UrunId
 
 select * from tblUrunler order by Stok desc
 
 -- giriþ iþlemi yapan müþterilerim bilgileri 
select * from tblKullanici where Kullid in (select IslemKulId from tblIslem where TurId=1)
insert into tblKullanici(KulTurId,Ad,Soyad,Tlf,Mail,Adres,Resim) values (1,'Furkan','Çamyar','05236547896','furkan@gmail.com','Ordu/Ünye','furkan.jpg')

select * from tblKullanici where 
exists (select * from tblIslem where TurId=1 and tblKullanici.Kullid=tblIslem.IslemKulId)

-- iþlem yapmayan kiþiler
select * from tblKullanici where 
not exists (select * from tblIslem where TurId=1 and tblKullanici.Kullid=tblIslem.IslemKulId)

--09.11.2022 tarihli iþlemler

use dbDepo
-- en fazla ürün griþi gerçekleþtirren kiþi yi bulan sorguyu yazýnýz?
select * from tblIslemTur

select * from tblIslem 
inner join tblKullanici on tblIslem.IslemKulId=tblKullanici.Kullid  where tblIslem.TurId=1

select SUM(Miktar) as toplamUrun from tblIslem 
inner join tblKullanici on tblIslem.IslemKulId=tblKullanici.Kullid 

select SUM(Miktar) as ToplamGiris from tblIslem 
inner join tblKullanici on tblIslem.IslemKulId=tblKullanici.Kullid where tblIslem.TurId=1

select SUM(Miktar) as toplamCikis from tblIslem 
inner join tblKullanici on tblIslem.IslemKulId=tblKullanici.Kullid where tblIslem.TurId=2

select SUM(Miktar) as toplamUrun from tblIslem 

select SUM(Miktar) as ToplamGiris from tblIslem 
where TurId=1

select IslemKulId, SUM(Miktar) as toplamCikis from tblIslem 
id where TurId=2 group by IslemKulId

select IslemKulId, COUNT(*) as toplamCikis from tblIslem 
id where TurId=2 group by IslemKulId

select top 1 IslemKulId, tblKullanici.Ad, SUM(Miktar) as toplamGiris from tblIslem 
inner join tblKullanici on tblIslem.IslemKulId=tblKullanici.Kullid 
where TurId in (select Turid from tblIslemTur where Ad='Giriþ') group by IslemKulId, tblKullanici.Ad order by toplamGiris desc

select * from tblUrunler 
inner join tblBeden on tblUrunler.UrunBedenId=tblBeden.Id
inner join tblUrunSex on tblUrunler.UrunSexId=tblUrunSex.UrunSexId
where tblUrunler.UrunCinsId=1 and tblUrunSex.UrunSexId=1 and
tblBeden.Olcu between 35 and 37

update tblUrunler set UrunBedenId=21 where UrunId=2
update tblUrunler set UrunBedenId=13 where UrunId=44

select * from tblUrunSex

use dbDepo

--5 soru
select Ad as ÝþlemTür , COUNT(*) as ÝþlemAdet from tblIslem 
inner join tblIslemTur on tblIslem.TurId=tblIslemTur.Turid
group by Ad

-- 4 soru
select tblUrunler.Adi,tblUrunler.Fiyat, tblIslem.Tarih,tblIslem.Miktar from tblIslem 
inner join tblUrunler on tblUrunler.UrunId=tblIslem.UrunId
where Tarih between '06/13/2022' and '11/15/2022' and TurId in (select Turid from tblIslemTur where Ad='Çýkýþ')

-- 3 soru
select TurId,SUM(miktar) from tblIslem where UrunId=2 group by TurId

-- 2 soru
select Ad,Soyad,Tlf,Adi,Fiyat from tblIslem 
inner join tblKullanici on tblKullanici.Kullid=tblIslem.IslemKulId
inner join tblUrunler on tblUrunler.UrunId=tblIslem.UrunId
where IslemId=13

-- 1 soru
alter table tblUrunler add Kampanya int 




-- Vize sonrasý//////////////////////////////////////////////////////////////




-- 07.12.2022 tarihli iþlemler Ders-1
use dbDepo
select * from tblKullTur
select * from tblKullanici
select distinct PersonelKulId  from tblIslem
select * from tblIslem
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

-- soru 2 10.10.2022 tarihinde satýlan kadýn üst giyim ürünlerinin toplam miktarý ve fiyatý
select tblKullanici.Ad, tblKullTur.Ad from tblIslem 
inner join tblKullanici on tblKullanici.Kullid=tblIslem.IslemKulId
inner join tblKullTur on tblKullTur.id=tblKullanici.KulTurId

inner join tblUrunler on tblUrunler.UrunId=tblIslem.UrunId
inner join tblUrunSex on tblUrunSex.UrunSexId=tblUrunler.UrunSexId
where TurId=2 and Tarih='10/10/2022' and tblUrunler.UrunSexId=1


-- soru 2 10.10.2022 tarihinde satýlan kadýn üst giyim ürünlerinin toplam miktarý ve fiyatý
select SUM(Miktar*Fiyat) from tblIslem 
inner join tblKullanici on tblKullanici.Kullid=tblIslem.IslemKulId
inner join tblKullTur on tblKullTur.id=tblKullanici.KulTurId
inner join tblUrunler on tblUrunler.UrunId=tblIslem.UrunId
inner join tblUrunSex on tblUrunSex.UrunSexId=tblUrunler.UrunSexId
where TurId=2 and Tarih='10/10/2022' and tblUrunler.UrunSexId=1

--soru 3 ayakkabý numarasý 40 olup satýlan kadýn ayakkablarý 
select tblUrunler.Adi, tblUrunler.Fiyat, tblIslem.Miktar from tblUrunler
inner join tblIslem on tblIslem.UrunId = tblUrunler.UrunId
inner join  tblUrunSex on tblUrunSex.UrunSexId=tblUrunler.UrunSexId
inner join tblBeden on tblBeden.Id=tblUrunler.UrunBedenId
inner join tblIslemTur on tblIslemTur.Turid= tblIslem.IslemKulId
where tblUrunSex.UrunSexId=1 and tblBeden.Olcu='36' and tblIslemTur.Turid=2

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
--Soru 2) Müþteriler en çok ne zaman alýþveriþ yapmýþ?
select * from tblIslem

-- 28.12.2022 tarihli ders
use dbDepo
--Soru 3) Veri tabanýndaki kullanýcýlarýn en az giriþ yaptýðý kategoriyi listeleyen sorguyu yazýnýz.

select top 1 KategoriAdi, COUNT(*) as Adet from tblUrunler inner join tblCins on tblUrunler.UrunCinsId=tblCins.CinsId
inner join tblKategori on tblKategori.KatId=tblCins.KatId group by KategoriAdi order by Adet asc

--rastgele bir ürün
select top 3 * from tblUrunler inner join tblCins on tblUrunler.UrunCinsId=tblCins.CinsId
inner join tblKategori on tblKategori.KatId=tblCins.KatId order by NEWID()

--Soru 3) Veri tabanýndaki her haketgorideki ürünlerin fiyatlarýnýn toplamý

select KategoriAdi, sum(Fiyat) as FiyatToplamý from tblUrunler inner join tblCins on tblUrunler.UrunCinsId=tblCins.CinsId
inner join tblKategori on tblKategori.KatId=tblCins.KatId group by KategoriAdi 

--depodaki mevcut ürünlerin fiyatýnýn toplamý
select KategoriAdi, sum(Fiyat*Stok) as FiyatToplamý from tblUrunler inner join tblCins on tblUrunler.UrunCinsId=tblCins.CinsId
inner join tblKategori on tblKategori.KatId=tblCins.KatId group by KategoriAdi 

--Soru 2) Veri tabanýndaki unisex ürünlerin içerisinde sayýsý olan ürünü listeleyiniz.
select tblUrunSex.Adi, COUNT(*) as Adet from tblUrunler 
inner join tblUrunSex on tblUrunler.UrunSexId=tblUrunSex.UrunSexId
group by tblUrunSex.Adi order by Adet desc

--Soru 2) Veri tabanýndaki unisex ürünlerin içerisinde en çok stoku olan ürünü listeleyiniz.
select top 1 tblUrunSex.Adi, SUM(Stok) as Adet from tblUrunler 
inner join tblUrunSex on tblUrunler.UrunSexId=tblUrunSex.UrunSexId
group by tblUrunSex.Adi order by Adet desc

--Soru 2) Aralýk ayýnýn haftalýk ve günlük net kazanç ne kadar?
select day(Tarih) as Gün, SUM(Miktar*Fiyat) as GünlükKazanc  from tblIslem 
inner join tblUrunler on tblUrunler.UrunId=tblIslem.UrunId
where MONTH(Tarih)=12 group by day(Tarih) 

--Soru 2) Aralýk ayýnýn haftalýk ve günlük ortlama net kazanç ne kadar?
select day(Tarih) as Gün, avg(Miktar*Fiyat) as GünlükKazanc  from tblIslem 
inner join tblUrunler on tblUrunler.UrunId=tblIslem.UrunId
where MONTH(Tarih)=12 group by day(Tarih) 

--12 aylýk günlük ortlama net kazanç ne kadar
select day(Tarih) as Gün, SUM(Miktar*Fiyat) as GünlükTopKazanc  from tblIslem 
inner join tblUrunler on tblUrunler.UrunId=tblIslem.UrunId
 group by day(Tarih) 

--Soru 2) 12 ayýnýn h  günlük ortlama net kazanç ne kadar?
select day(Tarih) as Gün, avg(Miktar*Fiyat) as GünlükOrtKazanc  from tblIslem 
inner join tblUrunler on tblUrunler.UrunId=tblIslem.UrunId
 group by day(Tarih)

 --Soru 1) Ürün cinsi gömlek ve bedeni M olan aç ürün satýklmýþtýr?

select COUNT(*) as SatýþAdeti from tblIslem
inner join tblUrunler on tblIslem.UrunId=tblUrunler.UrunId
inner join tblBeden on tblBeden.Id=tblUrunler.UrunBedenId
inner join tblCins on tblUrunler.UrunCinsId=tblCins.CinsId
where tblCins.Adi='Gömlek' and tblBeden.Olcu='M' and tblIslem.TurId=2