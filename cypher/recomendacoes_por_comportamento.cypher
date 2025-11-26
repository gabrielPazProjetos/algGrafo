:param userId => 'u1';
:param limit => 10;

MATCH (u:User {userId: $userId})-[:LIKED]->(t:Track)
MATCH (other:User)-[:LIKED]->(t)
WHERE other <> u
WITH u, other, count(*) AS overlap
ORDER BY overlap DESC
LIMIT 5
MATCH (other)-[:LIKED]->(rec:Track)
WHERE NOT EXISTS { MATCH (u)-[:LISTENED]->(rec) }
RETURN other.userId AS vizinho, rec.titulo AS faixa, overlap AS afinidade
ORDER BY afinidade DESC, faixa
LIMIT $limit;
