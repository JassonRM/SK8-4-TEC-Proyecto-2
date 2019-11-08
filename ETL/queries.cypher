MATCH (n:SKU)-[relation:`SOLD WITH`]-(n2:SKU) WHERE n.IdSKU = "1" RETURN relation.weight, n2.IdSKU ORDER BY relation.weight DESC

MATCH (n:SKU)-[relation:`SOLD WITH`]-(n2:SKU) WHERE n.IdSKU = "1" RETURN n2 ORDER BY relation.weight DESC LIMIT 3
