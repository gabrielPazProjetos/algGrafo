:param userId => 'u1';
:param minScore => 0.5;
:param limit => 10;

MATCH (u:User {userId: $userId})-[:FOLLOWS]->(a:Artist)
MATCH (a)-[rel:RELATED_TO]->(a2:Artist)
WHERE rel.score >= $minScore
MATCH (a2)<-[:BY]-(rec:Track)
WHERE NOT EXISTS { MATCH (u)-[:LISTENED]->(rec) }
RETURN a.nome AS seguido, a2.nome AS similar, rel.score AS score, rec.titulo AS faixa
ORDER BY score DESC, faixa
LIMIT $limit;
