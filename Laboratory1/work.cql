
///////////////////////INSERT//////////////////


INSERT INTO vadim_pits."Products_Characteristic_Store_Recommend"(id_prod, name_prod, colour, price, counter, id_store, name_store, result, final_name_1)
VALUES (1,{"name": 'Lexus', "model": 'LX350'}, 'white', 30000, 2, 1, 'Japan', {'is available':{'Japan'}}, {"name": 'Lexus', "model": 'LX350'});

INSERT INTO vadim_pits."Products_Characteristic_Store_Recommend"(id_prod, name_prod, colour, price, counter, id_store, name_store, result, final_name_1)
VALUES (2,{"name": 'BMW', "model": '540'}, 'black', 40000, 0, 2, 'Germany', {'not available':{'Germany'}}, {"name": 'BMW', "model": '540'});

INSERT INTO vadim_pits."Products_Characteristic_Store_Recommend"(id_prod, name_prod, colour, price, counter, id_store, name_store, result, final_name_1)
VALUES (3,{"name": 'Mazda', "model": '6'}, 'green', 10000, 3, 4, 'UK', {'is available':{'UK'}}, {"name": 'Mazda', "model": '6'});

SELECT * FROM vadim_pits."Products_Characteristic_Store_Recommend";

///////////////////////UPDATE//////////////////

UPDATE vadim_pits."Products_Characteristic_Store_Recommend"
SET 
  price= 37000,
  name_store = 'USA'
WHERE id_prod = 1 AND colour = 'white' AND id_store = 1 IF EXISTS;

UPDATE vadim_pits."Products_Characteristic_Store_Recommend"
SET 
  name_prod= {
              name: 'Mazda',
              model: '6'
              } ,
  final_name_1= {
              name: 'Mazda',
              model: '6'
              }                    
WHERE id_prod = 3 AND colour = 'green' AND id_store = 4 IF EXISTS;

UPDATE vadim_pits."Products_Characteristic_Store_Recommend"
SET 
  counter = 5
WHERE id_prod = 2 AND colour = 'black' AND id_store = 2 IF EXISTS;

SELECT * FROM vadim_pits."Products_Characteristic_Store_Recommend";
/* 
SELECT name_store 
FROM vadim_pits."Products_Characteristic_Store_Recommend"
WHERE  id_prod = 1
ALLOW FILTERING;

SELECT price 
FROM vadim_pits."Products_Characteristic_Store_Recommend"
WHERE  id_prod = 3
ALLOW FILTERING;
*/

///////////////////////SELECT//////////////////

CREATE INDEX ind1 on vadim_pits."Products_Characteristic_Store_Recommend"(name_prod);

SELECT name_store, price 
FROM vadim_pits."Products_Characteristic_Store_Recommend"
WHERE name_prod = {"name": 'Mazda', "model": '6'};

SELECT colour, price 
FROM vadim_pits."Products_Characteristic_Store_Recommend"
WHERE id_prod = 2;

SELECT counter, name_store 
FROM vadim_pits."Products_Characteristic_Store_Recommend"
WHERE name_prod = {"name": 'BMW', "model": '540'};

CREATE INDEX ind2 on vadim_pits."Products_Characteristic_Store_Recommend"(colour);

SELECT colour, name_prod 
FROM vadim_pits."Products_Characteristic_Store_Recommend"
WHERE colour = 'black';

///////////////////////DELETE//////////////////

DELETE result
FROM vadim_pits."Products_Characteristic_Store_Recommend"
WHERE id_prod = 1 AND colour = 'white' AND id_store = 1;

DELETE counter
FROM vadim_pits."Products_Characteristic_Store_Recommend"
WHERE id_prod = 1 AND colour = 'white' AND id_store = 1;

DELETE name_store
FROM vadim_pits."Products_Characteristic_Store_Recommend"
WHERE id_prod = 1 AND colour = 'white' AND id_store = 1;

SELECT * FROM vadim_pits."Products_Characteristic_Store_Recommend";
