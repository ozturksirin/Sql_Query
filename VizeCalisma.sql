create database dbFinal

use dbFinal

create table tblKategori(
KatId int not null identity primary key,
KategoriAdi varchar(20) not null,
Resim varchar(50) not null,
KategoriDetay varchar(250) not null
)
-- /////////////////////////////////////

create table tblCins(
CinsId int not null identity primary key,
KatId int not null foreign key references tblKategori(KatId),
Adi varchar(20)not null,
Resim varchar(50) not null,
Detay varchar(250) not null
)

create table tblBeden(
Id int not null identity primary key,
KatId int not null foreign key references tblKategori(KatId),
Olcu varchar(20) not null
)