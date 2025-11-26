:param userId => 'u1';
:param minScore => 0.6;
:param limit => 5;

MATCH p = (u:User {userId: $userId})-[:FOLLOWS]->(a:Artist)-[r:RELATED_TO]->(a2:Artist)<-[:BY]-(rec:Track)
WHERE r.score >= $minScore AND NOT (u)-[:LISTENED]->(rec)
RETURN rec.titulo AS faixa, a.nome AS origem, a2.nome AS similar, r.score AS score, p
ORDER BY score DESC, faixa
LIMIT $limit;
