from py2neo import *
import csv

print('Establishing neo4j connection...')
graph = Graph(auth=('neo4j', 'wCv3AbY8jC'))
tx = graph.begin()

print('Removing neo4j previous records...')
graph.delete_all()

print('Loading neo4j new nodes...')
with open('Nodes.csv') as nodes:
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
    print(f'Processed {line_count} Nodes.')

print('Loading neo4j new relationships...')
with open('Relationships.csv') as relationships:
    csv_reader = csv.reader(relationships, delimiter=',')
    line_count = 0
    for row in csv_reader:
        if line_count == 0:
            line_count += 1
            continue

        matcher = NodeMatcher(graph)
        source = matcher.match("SKU", IdSKU=row[0]).first()
        target = matcher.match("SKU", IdSKU=row[1]).first()
        new_relationship = Relationship(source, "SOLD WITH", target, weight = int(row[2]))
        graph.merge(new_relationship)
        line_count += 1
    print(f'Processed {line_count} Relationships.')
