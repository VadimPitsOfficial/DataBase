CREATE KEYSPACE vadim_pits
WITH replication = {
	'class' : 'SimpleStrategy',
	'replication_factor' : 1
};


CREATE TYPE IF NOT EXISTS vadim_pits."prod_type"(
	name text,
	model text
);


CREATE TABLE vadim_pits."Products_Characteristic_Store_Recommend"(
	id_prod int,
	name_prod FROZEN<prod_type>,
	colour text,
	price float static,
	counter int,
	id_store int,
	name_store text,
	result map<text, FROZEN <set<text>>>,
	final_name_1 FROZEN <prod_type>,
	PRIMARY KEY((id_prod), colour, id_store)
	);
	
	
	/*
  CREATE TABLE vadim_pits."Products"(
	id_prod int,
	name_prod FROZEN<prod_type>,
	PRIMARY KEY(id_prod)
);

CREATE TABLE vadim_pits."Characteristic"(
	colour text,
	price float,
	counter int,
	PRIMARY KEY(price)
);

CREATE TABLE vadim_pits."Store"(
	id_store int,
	name_store text,
	PRIMARY KEY(id_store)
);

CREATE TABLE vadim_pits."Recommendation"(
	result map<text, FROZEN <set<text>>>,
	final_name FROZEN <prod_type>,
	PRIMARY KEY(final_name)
); */
