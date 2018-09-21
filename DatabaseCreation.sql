 go 
use GestionBanquaire

create table gb_CTB_CategorieTransactionBancaire
(
	id int primary key IDENTITY(1, 1) not null,
	nom varchar(25) not null,
	logo varchar(255)
)

create table gb_BQE_Banque
(
	id int primary key IDENTITY(1, 1) not null,
	nom varchar(25) not null,
	logo varchar(255)
)

create table gb_TPC_TypeContre
(
	id int primary key IDENTITY(1, 1) not null,
	nom varchar(25) not null,
	argentBlocker bit default 0
)

create table gb_CPB_CompteBancaire
(
	id int primary key IDENTITY(1, 1) not null,
	montant float,
	TPC_id int foreign key references gb_TPC_TypeContre(id) not null,
	BQE_id int foreign key references gb_BQE_Banque(id) not null

)

create table gb_TRB_TransactionBanqcaire
(
	id int primary key IDENTITY(1, 1) not null,
	montant float,
	commentaire varchar(100),
	CPB_id_Debiteur int foreign key references gb_CPB_CompteBancaire(id),
	CPB_id_Crediteur int foreign key references gb_CPB_CompteBancaire(id) not null,
	CTB_id int foreign key references gb_CTB_CategorieTransactionBancaire(id) not null

)
