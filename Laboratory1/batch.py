from cassandra.cluster import Cluster

cluster = Cluster()
connection = cluster.connect('vadim_pits')

batch = """
BEGIN BATCH
INSERT INTO vadim_pits."Products_Characteristic_Store_Recommend"(id_prod, name_prod, colour, price, counter, id_store, name_store, result, final_name_1)
VALUES (1,{"name": 'Lexus', "model": 'LX350'}, 'white', 30000, 2, 1, 'Japan', {'is available':{'Japan'}}, {"name": 'Lexus', "model": 'LX350'});

INSERT INTO vadim_pits."Products_Characteristic_Store_Recommend"(id_prod, name_prod, colour, price, counter, id_store, name_store, result, final_name_1)
VALUES (2,{"name": 'BMW', "model": '540'}, 'black', 40000, 0, 2, 'Germany', {'not available':{'Germany'}}, {"name": 'BMW', "model": '540'});

APPLY BATCH;
"""
connection.execute(batch)