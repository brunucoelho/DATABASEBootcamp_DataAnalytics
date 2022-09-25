CREATE DATABASE `oficina`;

create table clients(
		id_client int auto_increment primary key,
		nome varchar(255),
    cpf char(11),
		constraint unique_cpf_client unique (CPF)
);

create table marca(
		id_marca int auto_increment primary key,
		marca varchar(255)
);

-- criando tabela funcionarios
create table funcionarios(
		id_funcionario int auto_increment primary key,
		nome varchar(255),
cpf char(11)

)


-- criando tabela 
create table precos(
		id_preco int auto_increment primary key,
		serviço varchar(255),
tipo varchar(255)
                


);

create table carro(
		id_carro int auto_increment primary key,
id_marca int,
id_client int,
		constraint marca_fk foreign key(id_marca) references marca(id_marca),
                constraint client_fk foreign key(id_client) references clients(id_client)
                
                


);
 
ALTER TABLE carro
ADD COLUMN placa varchar(10);

ALTER TABLE funcionarios
ADD COLUMN tipo enum('mecanico','gerente','secretaria');


create table mecanicos(
		id_mecanicos int auto_increment primary key,
id_funcionario int,

		constraint funcionario_fk foreign key(id_funcionario) references funcionarios(id_funcionario)

);

ALTER TABLE mecanicos
ADD COLUMN especialidade varchar(255)


create table equipe(
		id_equipe int auto_increment primary key,

nome_equipe varchar(30)


);


create table equipe_mecanico(
		
id_equipe int,
id_mecanico int,
		constraint equipe_fk foreign key(id_equipe) references equipe(id_equipe),
                constraint mecanico_fk foreign key(id_mecanico) references mecanico(id_mecanico)

);

create table ordem_sevico(
id_ordem int auto_increment primary key,
id_client int,		
id_equipe int,

id_carro int,
 constraint client_ordem_fk foreign key(id_client) references clients(id_client),
constraint equipe_ordem_fk foreign key(id_equipe) references equipe(id_equipe),

constraint id_carro_ordem_fk foreign key(id_carro) references carro(id_carro)



);

insert into clients(nome,cpf)
		values('Antonio X', 12346789),
		('deotado manaco', 14386789),
('jusé geninho', 12386799);

INSERT INTO marca
VALUES ('fiat'),
('vw');


INSERT INTO carro (id_marca, id_client)
VALUES (3,1),(4,2);

insert into funcionarios(nome,cpf,tipo)
values('Carlitos',123456677,'mecanico'),
('Andre',123457654,'mecanico'),
('Rosa',1234656677,'secretaria'),
('Romildo',123456677,'mecanico');

alter table mecanico 
ADD COLUMN especialide VARCHAR(15);



insert into mecanico(id_funcionario,especialide)
values(1,'carburadores'),
(2,'tratores');



insert into equipe(nome_equipe)
values('fogareiros'),
('trabalhaBem');

insert into equipe_mecanico
values(1,2),
(2,1);


ALTER TABLE ordem_servico
ADD COLUMN tipo enum('reparo','preventiva','troca de óleo'),
ADD COLUMN valor float, 
ADD COLUMN status_client enum('não permitido','permitido'),
ADD COLUMN status enum('em andamento','esperando peças','completo'),
ADD COLUMN data_emissao datetime,
ADD COLUMN data_conclusao datetime;


create table tabela_precos(
 id_tabela_precos int auto_increment primary key,
 tipo varchar(255),
preco float
 
);

create table tabela_precos_tipos(
id_precos_tipos int auto_increment primary key,
id_tabela_precos int,		

constraint id_tabela_precos_fk foreign key(id_tabela_precos) references tabela_precos(id_tabela_precos)

);

insert into tabela_precos(tipo,preco) 
values('reparo de bomba', 300),
('troca de óleo', 100),
('troca de tampa da valvula',100),
('troca de pastilha freio', 300);

insert into tabela_precos_tipos(id_tabela_precos)
values(1),(3),(4),(2);

insert into ordem_servico(
id_client,
id_equipe,
id_carro,	
tipo,	
valor,
status_client,
status,

preco_tipos)
values(1,2,2,'reparo',3000,'permitido','em andamento',2);

insert into ordem_servico(
id_client,
id_equipe,
id_carro,	
tipo,	
valor,
status_client,
status,

preco_tipos)
values(2,1,2,'reparo',5000,'permitido','completo',2);


select nome,marca from marca,clients where nome = 'Antonio X';

ALTER TABLE carro
ADD COLUMN modelo_carro varchar(255);

UPDATE `carro` SET
`id_carro` = '1',
`id_marca` = '3',
`id_client` = '1',
`modelo_carro` = 'Siena'
WHERE `id_carro` = '1';

UPDATE `carro` SET
`id_carro` = '2',
`id_marca` = '4',
`id_client` = '2',
`modelo_carro` = 'Gol'
WHERE `id_carro` = '2';

select clients.nome, carro.modelo_carro from ordem_servico, carro, clients;

select clients.nome, carro.modelo_carro, id_ordem from ordem_servico, carro, clients where clients.id_client = 1;

select  distinct c.nome, modelo_carro,  valor*10  as total from clients as c, carro, ordem_servico;

select  distinct c.nome, modelo_carro,  valor*10  as total from clients as c, carro, ordem_servico GROUP BY c.nome;

select c.nome, modelo_carro,  valor*10  as total from clients as c, carro, ordem_servico GROUP BY c.nome ORDER BY total desc;

insert into ordem_servico(
id_client,
id_equipe,
id_carro,	
tipo,	
valor,
status_client,
status,

preco_tipos)
values(1,1,1,'reparo',5000,'permitido','completo',2);

insert into ordem_servico(
id_client,
id_equipe,
id_carro,	
tipo,	
valor,
status_client,
status,

preco_tipos)
values(1,1,1,'reparo',5000,'permitido','completo',2);


select distinct nome, nome_equipe from mecanico, equipe_mecanico, funcionarios, ordem_servico;

select c.nome, modelo_carro from clients as c join carro  as car ON c.id_client = car.id_client;

select c.nome, modelo_carro,  valor*10  as total from clients as c, carro, ordem_servico GROUP BY c.nome having(nome) = "Jose Fulano X";

select c.nome, modelo_carro,  valor*10  as total from clients as c, carro, ordem_servico GROUP BY c.nome having(modelo_carro) = "Manboow bee";