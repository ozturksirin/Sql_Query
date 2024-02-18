use dbDepo

alter table tblUrunler add Stok int not null

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

select sum(tblIslem.Miktar) as 'Toplam �r�n Miktar�' from tblIslem 
inner join tblIslemTur on tblIslem.TurId=tblIslemTur.Turid
inner join tblKullanici on tblIslem.IslemKulId=tblKullanici.Kullid
where (Tarih between '01.10.2022' and '05.10.2022') and tblIslemTur.Ad='Giri�' and tblKullanici.Ad='Oguzhan'

use dbDepo

insert into tblKullTur (Ad) values ('Y�netici')

select * from tblKullTur

insert into tblKullanici (KulTurId,Ad,Soyad,Tlf,Mail,Adres,Resim) 
values (3,'Adem','Korkmaz','05322443934','adem@korkmazadem.com','Band�rma','adem.png')
insert into tblKullanici (KulTurId,Ad,Soyad,Tlf,Mail,Adres,Resim)
values(1,'Dilek','U�uzlu','05366548693','uguzludilek@gmail.com','Kocaeli','Dilek.png')

select * from tblKullanici

select tblKullanici.Kullid, tblKullTur.Ad,tblKullanici.Ad,tblKullanici.Soyad,tblKullanici.Tlf from tblKullanici 
inner join tblKullTur on tblKullanici.KulTurId=tblKullTur.id where tblKullTur.Ad='Y�netici'

/*nokta at��� direkt belli olan ki�inin parametresini g�nceller*/
update tblKullanici set KulTurId=3 where Kullid=7
select * from tblKullanici
/*kullId bilinmiyorsa, ismi belli olna ki�i veya ki�ileri g�nceller*/

update tblKullanici set KulTurId=3 where Ad='Enes'

/*belli parametreler g�re aran�p bulunan ki�inin de�erlerini g�ncelleme*/
select Ad,Soyad,Tlf from tblKullanici WHERE Ad='Enes'

update tblKullanici set KulTurId=2 where Kullid in 
(select Kullid from tblKullanici WHERE Ad='Enes')

select * from tblKullanici

/*�r�nlere ait cinsiyet kategorilerinin giri�i*/
insert into tblUrunSex (Adi,Detay,Resim) 
values ('Unisex','Hem kad�n hemde erkeklere ait �r�nler','unisexurunkategori.jpg')

select * from tblUrunSex

/*i�lem t�rlerinin belirlenmesi*/
insert into tblIslemTur(Ad,Detay) 
values ('�mha','Depodaki �r�nlerin stoktan ��k��s�z d��me i�lemi')

select * from tblIslemTur

/*�r�nlere ait kategorilerin tan�mlanmas�*/
insert into tblKategori (KategoriAdi,Resim,KategoriDetay) 
values ('D�� Giyim','disgiyim.jpg','Kad�n,erkek ve unisex e ait d�� giyim t�rleri')

select * from tblKategori

/*�r�nlere ait cins t�rlerinin belirlenmesi*/
insert into tblCins (KatId,Adi,Resim,Detay) 
values (1,'Spor','spor.jpg','Her cinsiyete ait spor ayakkab� t�rleri')

insert into tblCins(KatId,Adi,Resim,Detay)
values(1,'Bot','bot.jpg','Her cinsiyete ait bot t�rleri')
insert into tblCins(KatId,Adi,Resim,Detay)
values(1,'�izme','�izme.jpg','Her cinsiyete ait �izme t�rleri')
insert into tblCins(KatId,Adi,Resim,Detay)
values(1,'Babet','babet.jpg','Her cinsiyete ait babet t�rleri')
insert into tblCins(KatId,Adi,Resim,Detay)
values(1,'Topuklu','topuklu.jpg','Her cinsiyete ait topuklu t�rleri')
insert into tblCins(KatId,Adi,Resim,Detay)
values(1,'Sandalet','sandalet.jpg','Her cinsiyete ait sandalet t�rleri')
insert into tblCins(KatId,Adi,Resim,Detay)
values(1,'Terlik','terlik.jpg','Her cinsiyete ait terlik t�rleri')

select * from tblKategori

insert into tblCins (KatId,Adi,Resim,Detay)
values(2,'Sweatshirt','Sweatshirt.jpg','Her cinsiyete ait sweatshirt t�rleri')
insert into tblCins (KatId,Adi,Resim,Detay)
values(2,'Hoodie','Hoodie.jpg','Her cinsiyete ait hoodie t�rleri')
insert into tblCins (KatId,Adi,Resim,Detay)
values(2,'G�mlek','G�mlek.jpg','Her cinsiyete ait g�mlek t�rleri')
insert into tblCins (KatId,Adi,Resim,Detay)
values(2,'Kazak','Kazak.jpg','Her cinsiyete ait kazak t�rleri')
insert into tblCins (KatId,Adi,Resim,Detay)
values(2,'T-shirt','tshirt.jpg','Her cinsiyete ait T-shirt t�rleri')
insert into tblCins (KatId,Adi,Resim,Detay)
values(2,'Crop','crop.jpg','Her cinsiyete ait Crop t�rleri')

insert into tblCins(KatId,Adi,Resim,Detay)
values(3,'Kot Pantolon','kotpantolon.jpg','her cinsiyete ait kot pantolon t�rleri')
insert into tblCins(KatId,Adi,Resim,Detay)
values(3,'Kuma� Pantolon','kuma�pantolon.jpg','her cinsiyete ait kot pantolon t�rleri')
insert into tblCins(KatId,Adi,Resim,Detay)
values(3,'Kot �ort','kotsort.jpg','her cinsiyete ait kot �ort t�rleri')
insert into tblCins(KatId,Adi,Resim,Detay)
values(3,'Tayt','tayt.jpg','her cinsiyete ait tayt t�rleri')
insert into tblCins(KatId,Adi,Resim,Detay)
values(3,'Deniz �ortu','denizsortu.jpg','her cinsiyete ait deniz �ortu t�rleri')
insert into tblCins(KatId,Adi,Resim,Detay)
values(3,'Kapri','kapri.jpg','her cinsiyete ait kapri t�rleri')
insert into tblCins(KatId,Adi,Resim,Detay)
values(3,'Kalem Etek','kalemetek.jpg','her cinsiyete ait kalem etek t�rleri')
insert into tblCins(KatId,Adi,Resim,Detay)
values(3,'E�ofman','esofman.jpg','her cinsiyete ait e�ofman t�rleri')
insert into tblCins(KatId,Adi,Resim,Detay)
values(3,'�alvar','salvar.jpg','her cinsiyete ait �alvar t�rleri')

insert into tblCins (KatId,Adi,Resim,Detay)
values (4,'K�lot','K�lot.jpg','Her cinsiyete ait K�lot t�rleri')
insert into tblCins (KatId,Adi,Resim,Detay)
values (4,'��lik','��lik.jpg','Her cinsiyete ait ��lik t�rleri')
insert into tblCins (KatId,Adi,Resim,Detay)
values (4,'Atlet','Atlet.jpg','Her cinsiyete ait Atlet t�rleri')
insert into tblCins (KatId,Adi,Resim,Detay)
values (4,'Gecelik','Gecelik.jpg','Her cinsiyete ait Gecelik t�rleri')
insert into tblCins (KatId,Adi,Resim,Detay)
values (4,'Korse','Korse.jpg','Her cinsiyete ait Korse t�rleri')
insert into tblCins (KatId,Adi,Resim,Detay)
values (4,'Boxer','Boxer.jpg','Her cinsiyete ait Boxer t�rleri')
insert into tblCins (KatId,Adi,Resim,Detay)
values (4,'S�tyen','S�tyen.jpg','Kad�nlara ait s�tyen t�rleri')
insert into tblCins (KatId,Adi,Resim,Detay)
values (4,'B�stiyer','B�stiyer.jpg','Kad�nlara ait b�stiyer t�rleri')
insert into tblCins (KatId,Adi,Resim,Detay)
values (4,'Fanila','Fanila.jpg','Her cinsiyete ait Fanila t�rleri')


insert into tblCins (KatId,Adi,Resim,Detay)
values (5,'Kaban','kaban.jpg','her cinsiyete ait kaban t�rleri')
insert into tblCins (KatId,Adi,Resim,Detay)
values (5,'Pard�s�','pard�s�.jpg','her cinsiyete ait pard�s� t�rleri')
insert into tblCins (KatId,Adi,Resim,Detay)
values (5,'Ceket','ceket.jpg','her cinsiyete ait ceket t�rleri')

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

/*�r�n tan�mlama i�lemi*/
select * from tblUrunSex
select * from tblCins
select * from tblBeden

insert into tblUrunler (UrunSexId,UrunCinsId,UrunBedenId,Adi,Resim,Fiyat,Renk,Detay,Stok) values
(1,11,36,'Vatkal� Yar�m Bal�k�� Fermuarl�','vatkali.jpg','150','Siyah','Yar�m bal�k��, fermuarl�.',0)

use dbDepo

alter table tblUrunler ALTER COLUMN Adi varchar(50) not null

select * from tblBeden

select * from tblUrunler
delete from tblUrunler where UrunId=13

select * from tblKategori

insert into tblUrunler(UrunSexId,UrunCinsId,UrunBedenId,Adi,Resim,Fiyat,Renk,Detay,Stok)
 values(3,23,21,'k�lot','k�lot.jpg','200' ,'beyaz','dantelli',0)

 insert into tblUrunler(UrunSexId,UrunCinsId,UrunBedenId,Adi,Resim,Fiyat,Renk,Detay,Stok)
 values(3,24,22,'termal i�l�k','i�lik.jpg','100' ,'Siyah','s�cak tutan',0)

 insert into tblUrunler(UrunSexId,UrunCinsId,UrunBedenId,Adi,Resim,Fiyat,Renk,Detay,Stok)
 values(3,25,25,' pamuklu Atlet','Atlet.jpg','150' ,'beyaz','%pamuk',0)

 insert into tblUrunler(UrunSexId,UrunCinsId,UrunBedenId,Adi,Resim,Fiyat,Renk,Detay,Stok)
 values(1,26,23,'Bondi miral','gecelik.png','500' ,'beyaz','satenli',0)
 
 insert into tblUrunler(UrunSexId,UrunCinsId,UrunBedenId,Adi,Resim,Fiyat,Renk,Detay,Stok)
 values(1,27,34,'korse','korse.jpg','100' ,'Siyah','Bel Ve G�bek S�k�la�t�r�c�',0)

 insert into tblUrunler(UrunSexId,UrunCinsId,UrunBedenId,Adi,Resim,Fiyat,Renk,Detay,Stok)
 values(2,28,34,'boxer','boxer.jpg','50' ,'Siyah','kalvin klein boxer',0)

 insert into tblUrunler(UrunSexId,UrunCinsId,UrunBedenId,Adi,Resim,Fiyat,Renk,Detay,Stok)
 values(1,29,34,'sutyen','sutyen.jpg','90','k�rm�z�','dantelli',0)

  insert into tblUrunler(UrunSexId,UrunCinsId,UrunBedenId,Adi,Resim,Fiyat,Renk,Detay,Stok)
 values(1,30,34,'bustier','bustier.jpg','90','siyah','Cop Top B�stiyer',0)

 insert into tblUrunler(UrunSexId,UrunCinsId,UrunBedenId,Adi,Resim,Fiyat,Renk,Detay,Stok)
 values(1,31,34,'fanila','fanila.jpg','100','siyah',' %100 Pamuk �p ',0)

 insert into tblUrunler(UrunSexId,UrunCinsId,UrunBedenId,Adi,Resim,Fiyat,Renk,Detay,Stok)
 values(1,32,34,'kaban','kaban.jpg','100','siyah',' %I�i Astarl� Uzun Ka�e Kaban ',0)

 insert into tblUrunler(UrunSexId,UrunCinsId,UrunBedenId,Adi,Resim,Fiyat,Renk,Detay,Stok)
 values(1,33,34,'pardosu','pardosu.jpg','350','siyah',' %100 Pamuk �p ',0)

 insert into tblUrunler(UrunSexId,UrunCinsId,UrunBedenId,Adi,Resim,Fiyat,Renk,Detay,Stok)
 values(3,34,34,'ceket','ceket.jpg','100','beyaz',' su gecirmez ',0)

select * from tblUrunler
--Depodaki �r�nlerin fiyat ortalamas�n� veren sorguyu yaz�n�z?
select avg(Fiyat) as ortalama from tblUrunler

--Depodaki �r�nlerin fiyat ortalamas�n� veren sorguyu AVG parameeresi kullanmadan yaz�n�z?
select sum(Fiyat) as toplam from tblUrunler 
select count(*) as UrunSayisi from tblUrunler

select (sum(Fiyat))/(count(*)) as OrtalamaFiyat from tblUrunler 

--Eny�ksek Fiyat ile en d���k fiyat�n toplam�n� toplam �r�n say�s�na b�len sorguyu yaz�n�z
select MAX(Fiyat) from tblUrunler --en y�ksek �r�n fiyat
select MIN(Fiyat) from tblUrunler  -- en d���k �r�n fiyat
select MAX(Fiyat)+MIN(Fiyat) from tblUrunler --en y�ksek �r�n ile enb d���k �r�n fiyatn�n toplam�
select (MAX(Fiyat)+MIN(Fiyat))/COUNT(*) from tblUrunler

--fiyat ortalamas� i�in
select (MAX(Fiyat)+MIN(Fiyat))/2 from tblUrunler
select * from tblUrunler

--en y�ksek fiyatl� �r�n/�r�nler bulundu�u kategorinin ad�n� listeleyen sorguyu yaz�n�z?
select max(Fiyat) from tblUrunler 
select KategoriAdi from tblKategori

select KategoriAdi,tblUrunler.Adi,tblUrunler.Fiyat from tblUrunler 
inner join tblCins on tblUrunler.UrunCinsId=tblCins.CinsId
inner join tblKategori on tblKategori.KatId=tblCins.KatId
where Fiyat in (select max(Fiyat) from tblUrunler )

--26.10.2022 tarihli �al��malar
use dbDepo

select * from tblUrunler
select * from tblKullTur
select * from tblKullanici
-- hangi cins t�r�nde ka� tane �r�n oldu�unu listeleyen sorguyu yaz�n�z?
select tblCins.Adi,COUNT(*) from tblUrunler 
inner join tblCins on tblUrunler.UrunCinsId=tblCins.CinsId
group by tblCins.Adi

--kategorilerde ka� �e�it �r�n old�unu listeyen sorguyu yaz�n�z?

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

--02.11.2022 tarihli i�lemler
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

--tekli g�ncelleme
UPDATE tblUrunler SET Stok =  (SELECT Miktar FROM tblIslem WHERE TurId = 1 and UrunId=2) WHERE tblUrunler.UrunId = 2

--- �oklu g�ncelleme
update tblUrunler set Stok=Stok+{1} where UrunId={0} (select UrunId,Miktar from tblIslem where TurId=1 )

UPDATE tblUrunler SET Stok = Stok + (SELECT Miktar FROM tblIslem WHERE TurId = 1) 
WHERE tblUrunler.UrunId = (SELECT UrunId FROM tblIslem WHERE TurId = 1)


select UrunId,COUNT(*) from tblIslem group by UrunId
 
 select * from tblUrunler order by Stok desc
 
 -- giri� i�lemi yapan m��terilerim bilgileri 
select * from tblKullanici where Kullid in (select IslemKulId from tblIslem where TurId=1)
insert into tblKullanici(KulTurId,Ad,Soyad,Tlf,Mail,Adres,Resim) values (1,'Furkan','�amyar','05236547896','furkan@gmail.com','Ordu/�nye','furkan.jpg')

select * from tblKullanici where 
exists (select * from tblIslem where TurId=1 and tblKullanici.Kullid=tblIslem.IslemKulId)

-- i�lem yapmayan ki�iler
select * from tblKullanici where 
not exists (select * from tblIslem where TurId=1 and tblKullanici.Kullid=tblIslem.IslemKulId)

--09.11.2022 tarihli i�lemler

use dbDepo
-- en fazla �r�n gri�i ger�ekle�tirren ki�i yi bulan sorguyu yaz�n�z?
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
where TurId in (select Turid from tblIslemTur where Ad='Giri�') group by IslemKulId, tblKullanici.Ad order by toplamGiris desc

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
select Ad as ��lemT�r , COUNT(*) as ��lemAdet from tblIslem 
inner join tblIslemTur on tblIslem.TurId=tblIslemTur.Turid
group by Ad

-- 4 soru
select tblUrunler.Adi,tblUrunler.Fiyat, tblIslem.Tarih,tblIslem.Miktar from tblIslem 
inner join tblUrunler on tblUrunler.UrunId=tblIslem.UrunId
where Tarih between '06/13/2022' and '11/15/2022' and TurId in (select Turid from tblIslemTur where Ad='��k��')

-- 3 soru
select TurId,SUM(miktar) from tblIslem where UrunId=2 group by TurId

-- 2 soru
select Ad,Soyad,Tlf,Adi,Fiyat from tblIslem 
inner join tblKullanici on tblKullanici.Kullid=tblIslem.IslemKulId
inner join tblUrunler on tblUrunler.UrunId=tblIslem.UrunId
where IslemId=13

-- 1 soru
alter table tblUrunler add Kampanya int 




-- Vize sonras�//////////////////////////////////////////////////////////////




-- 07.12.2022 tarihli i�lemler Ders-1
use dbDepo
select * from tblKullTur
select * from tblKullanici
select distinct PersonelKulId  from tblIslem
select * from tblIslem
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

-- soru 2 10.10.2022 tarihinde sat�lan kad�n �st giyim �r�nlerinin toplam miktar� ve fiyat�
select tblKullanici.Ad, tblKullTur.Ad from tblIslem 
inner join tblKullanici on tblKullanici.Kullid=tblIslem.IslemKulId
inner join tblKullTur on tblKullTur.id=tblKullanici.KulTurId

inner join tblUrunler on tblUrunler.UrunId=tblIslem.UrunId
inner join tblUrunSex on tblUrunSex.UrunSexId=tblUrunler.UrunSexId
where TurId=2 and Tarih='10/10/2022' and tblUrunler.UrunSexId=1


-- soru 2 10.10.2022 tarihinde sat�lan kad�n �st giyim �r�nlerinin toplam miktar� ve fiyat�
select SUM(Miktar*Fiyat) from tblIslem 
inner join tblKullanici on tblKullanici.Kullid=tblIslem.IslemKulId
inner join tblKullTur on tblKullTur.id=tblKullanici.KulTurId
inner join tblUrunler on tblUrunler.UrunId=tblIslem.UrunId
inner join tblUrunSex on tblUrunSex.UrunSexId=tblUrunler.UrunSexId
where TurId=2 and Tarih='10/10/2022' and tblUrunler.UrunSexId=1

--soru 3 ayakkab� numaras� 40 olup sat�lan kad�n ayakkablar� 
select tblUrunler.Adi, tblUrunler.Fiyat, tblIslem.Miktar from tblUrunler
inner join tblIslem on tblIslem.UrunId = tblUrunler.UrunId
inner join  tblUrunSex on tblUrunSex.UrunSexId=tblUrunler.UrunSexId
inner join tblBeden on tblBeden.Id=tblUrunler.UrunBedenId
inner join tblIslemTur on tblIslemTur.Turid= tblIslem.IslemKulId
where tblUrunSex.UrunSexId=1 and tblBeden.Olcu='36' and tblIslemTur.Turid=2

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
--Soru 2) M��teriler en �ok ne zaman al��veri� yapm��?
select * from tblIslem

-- 28.12.2022 tarihli ders
use dbDepo
--Soru 3) Veri taban�ndaki kullan�c�lar�n en az giri� yapt��� kategoriyi listeleyen sorguyu yaz�n�z.

select top 1 KategoriAdi, COUNT(*) as Adet from tblUrunler inner join tblCins on tblUrunler.UrunCinsId=tblCins.CinsId
inner join tblKategori on tblKategori.KatId=tblCins.KatId group by KategoriAdi order by Adet asc

--rastgele bir �r�n
select top 3 * from tblUrunler inner join tblCins on tblUrunler.UrunCinsId=tblCins.CinsId
inner join tblKategori on tblKategori.KatId=tblCins.KatId order by NEWID()

--Soru 3) Veri taban�ndaki her haketgorideki �r�nlerin fiyatlar�n�n toplam�

select KategoriAdi, sum(Fiyat) as FiyatToplam� from tblUrunler inner join tblCins on tblUrunler.UrunCinsId=tblCins.CinsId
inner join tblKategori on tblKategori.KatId=tblCins.KatId group by KategoriAdi 

--depodaki mevcut �r�nlerin fiyat�n�n toplam�
select KategoriAdi, sum(Fiyat*Stok) as FiyatToplam� from tblUrunler inner join tblCins on tblUrunler.UrunCinsId=tblCins.CinsId
inner join tblKategori on tblKategori.KatId=tblCins.KatId group by KategoriAdi 

--Soru 2) Veri taban�ndaki unisex �r�nlerin i�erisinde say�s� olan �r�n� listeleyiniz.
select tblUrunSex.Adi, COUNT(*) as Adet from tblUrunler 
inner join tblUrunSex on tblUrunler.UrunSexId=tblUrunSex.UrunSexId
group by tblUrunSex.Adi order by Adet desc

--Soru 2) Veri taban�ndaki unisex �r�nlerin i�erisinde en �ok stoku olan �r�n� listeleyiniz.
select top 1 tblUrunSex.Adi, SUM(Stok) as Adet from tblUrunler 
inner join tblUrunSex on tblUrunler.UrunSexId=tblUrunSex.UrunSexId
group by tblUrunSex.Adi order by Adet desc

--Soru 2) Aral�k ay�n�n haftal�k ve g�nl�k net kazan� ne kadar?
select day(Tarih) as G�n, SUM(Miktar*Fiyat) as G�nl�kKazanc  from tblIslem 
inner join tblUrunler on tblUrunler.UrunId=tblIslem.UrunId
where MONTH(Tarih)=12 group by day(Tarih) 

--Soru 2) Aral�k ay�n�n haftal�k ve g�nl�k ortlama net kazan� ne kadar?
select day(Tarih) as G�n, avg(Miktar*Fiyat) as G�nl�kKazanc  from tblIslem 
inner join tblUrunler on tblUrunler.UrunId=tblIslem.UrunId
where MONTH(Tarih)=12 group by day(Tarih) 

--12 ayl�k g�nl�k ortlama net kazan� ne kadar
select day(Tarih) as G�n, SUM(Miktar*Fiyat) as G�nl�kTopKazanc  from tblIslem 
inner join tblUrunler on tblUrunler.UrunId=tblIslem.UrunId
 group by day(Tarih) 

--Soru 2) 12 ay�n�n h  g�nl�k ortlama net kazan� ne kadar?
select day(Tarih) as G�n, avg(Miktar*Fiyat) as G�nl�kOrtKazanc  from tblIslem 
inner join tblUrunler on tblUrunler.UrunId=tblIslem.UrunId
 group by day(Tarih)

 --Soru 1) �r�n cinsi g�mlek ve bedeni M olan a� �r�n sat�klm��t�r?

select COUNT(*) as Sat��Adeti from tblIslem
inner join tblUrunler on tblIslem.UrunId=tblUrunler.UrunId
inner join tblBeden on tblBeden.Id=tblUrunler.UrunBedenId
inner join tblCins on tblUrunler.UrunCinsId=tblCins.CinsId
where tblCins.Adi='G�mlek' and tblBeden.Olcu='M' and tblIslem.TurId=2