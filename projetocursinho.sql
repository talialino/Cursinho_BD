create database projetocurso;
use projetocurso;

-----------------------------------------------------Tabelas-----------------------------------------------------
create table estudante (
cod_est					smallint not null identity,
nome_est				varchar(40) not null,
cpf_est					varchar(11) not null,
rg_est					varchar(10) not null,
data_nasc_est			date not null,
ender_est				varchar(60),
fone_est				varchar(9) not null,
data_cadas				date not null,
curso_est				varchar(8) not null,
niveis_est				int not null,
constraint pk_primarykey_est primary key(cod_est));

/*insert into estudante (nome_est,cpf_est,rg_est,data_nasc_est,ender_est,fone_est,data_cadas,curso_est,niveis_est)
values
('Lua','12345678911','1234567891','20-03-1998','rua lua','888888888','03-03-19','inglês',1);*/

create table responsavel (
cod_resp				smallint not null identity,
nome_resp				varchar(40) not null,
rg_resp					varchar(10) not null,
cpf_resp				varchar(11) not null,
fone_resp				varchar(9) not null
constraint pk_primarykey_resp primary key(cod_resp)); 


create table notas(
cod_not					smallint not null identity,
cod_est					smallint not null references estudante,
nivel_not				varchar(13) not null,
nota_test_not			float not null,
nota_prov_not			float not null,
media_descri_not		varchar(9) not null
constraint pk_primarykey_not primary key(cod_not));


create table chamada (
data_cham				date not null,
cod_est					smallint not null references estudante,
frequenc_cham			smallint
constraint pk_primarykey_cham primary key(data_cham));

-----------------------------------------------------Procedures----------------------------------------------------
create proc inserirest
@nome_est				varchar(40),
@cpf_est				varchar(11),
@rg_est					varchar(10),
@data_nasc_est			date,
@ender_est				varchar(60),
@fone_est				varchar(9),
@data_cadas				date,
@curso_est				varchar(8),
@niveis_est				int
as
insert into estudante values(@nome_est,@cpf_est,@rg_est,@data_nasc_est,@ender_est,@fone_est,
@data_cadas,@curso_est,@niveis_est)


create proc inserirresp
@nome_resp				varchar(40),
@rg_resp				varchar(10),
@cpf_resp				varchar(11),
@fone_resp				varchar(9)
as
insert into responsavel values (@nome_resp,@rg_resp,@cpf_resp,@fone_resp)

create proc inserirnotas
@cod_est				smallint,
@nivel_not				varchar(13),
@nota_test_not			float,
@nota_prov_not			float,
@media_descri_not		varchar(9)
as
insert into notas values(@cod_est,@nivel_not,@nota_test_not,@nota_prov_not,@media_descri_not)

create proc inserirchama
@data_cham				date,
@cod_est				smallint,
@frequenc_cham			smallint
as
insert into chamada values (@data_cham,@cod_est,@frequenc_cham)



---------------------------------------------------functions-------------------------------------------------------
create function calcmedia(@n1 float, @n2 float)
returns float
begin
declare @media float
set @media=(@n1+@n2)/2
return @media
end

------------------------------------------------drops e selects---------------------------------------------------
drop database projetocurso;

drop table estudante;
drop table responsavel;
drop table notas;
drop table chamada;

select*from estudante;
select*from responsavel;
select*from notas;
select*from chamada;

drop proc inserirest;
drop proc inserirresp;
drop proc inserirchama;
drop proc inserirnotas;

drop function calcmedia;

/* 
 select dbo.calcmedia(23,22)  -------- inserir parâmetro e visualizar function 
*/

/*
exec inserirchama '27/01/1998',2,0  ------- inserir dados na procedure
exec inserirest;
exec inserirresp;
exec inserirnotas;
exec inserirchama; 
exec inserirest 'Lua','12345678911','1234567891','20-03-1998','rua lua','888888888','03-03-19','inglês',1;
*/
