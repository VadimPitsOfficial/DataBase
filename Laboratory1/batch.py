from cassandra.cluster import Cluster

cluster = Cluster()
connection = cluster.connect('vadim_pits')

batch = """
BEGIN BATCH
INSERT INTO vadim_pits."Products_Characteristic_Store_Recommend"(id_prod, name_prod, colour, price, counter, id_store, name_store, result, final_name_1)
VALUES (1,{"name": 'Lexus', "model": 'LX350'}, 'white', 30000, 2, 1, 'Japan', {'is available':{'Japan'}}, {"name": 'Lexus', "model": 'LX350'});

UPDATE vadim_pits."Products_Characteristic_Store_Recommend"
SET
  price= 37000,
  name_store = 'USA'
WHERE id_prod = 1 AND colour = 'white' AND id_store = 1 IF EXISTS;


APPLY BATCH;
"""
connection.execute(batch)
