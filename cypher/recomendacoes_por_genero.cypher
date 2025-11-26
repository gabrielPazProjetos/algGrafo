:param userId => 'u1';
:param limit => 10;
:param topGenres => 2;

MATCH (u:User {userId: $userId})-[:LISTENED]->(t:Track)-[:IN_GENRE]->(g:Genre)
WITH u, g, count(*) AS listens
ORDER BY listens DESC
LIMIT $topGenres
MATCH (g)<-[:IN_GENRE]-(rec:Track)
WHERE NOT EXISTS { MATCH (u)-[:LISTENED]->(rec) }
RETURN rec.titulo AS faixa, g.nome AS genero
ORDER BY genero, faixa
LIMIT $limit;
