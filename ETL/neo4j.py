from py2neo import *
import csv

print('Establishing neo4j connection...')
graph = Graph(auth = ('neo4j','wCv3AbY8jC'))
tx = graph.begin()

print('Removing neo4j previous records...')
graph.delete_all()

print('Loading neo4j new nodes...')
with open('SQL_flat_file.txt') as nodes:

    csv_reader = csv.reader(nodes, delimiter=',')
    line_count = 0
    col_name = []
    dict = {}
    for row in csv_reader:
        if line_count == 0:
            col_name = row
            line_count += 1
            continue
        else:
    	    for i in range(len(row)):
    	        dict[col_name[i]] = row[i]

        new_node = Node('SKU', **dict)
        tx.create(new_node)
        line_count += 1
    tx.commit()
    print(f'Processed {line_count} lines.')
