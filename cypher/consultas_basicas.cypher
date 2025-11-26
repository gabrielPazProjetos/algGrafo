MATCH (u:User) RETURN 'Users' AS tipo, count(u) AS total;
MATCH (t:Track) RETURN 'Tracks' AS tipo, count(t) AS total;
MATCH (a:Artist) RETURN 'Artists' AS tipo, count(a) AS total;
MATCH (g:Genre) RETURN 'Genres' AS tipo, count(g) AS total;

MATCH (u:User)-[l:LISTENED]->(t:Track)
RETURN u.userId AS user, t.trackId AS track, l.timestamp AS ts, l.device AS device
ORDER BY ts DESC
LIMIT 10;

MATCH (u:User)-[k:LIKED]->(t:Track)
RETURN u.userId AS user, t.trackId AS track, k.timestamp AS ts
ORDER BY ts DESC
LIMIT 10;

MATCH (u:User)-[f:FOLLOWS]->(a:Artist)
RETURN u.userId AS user, a.nome AS artist, f.since AS since
ORDER BY since DESC;

MATCH (a:Artist)-[r:RELATED_TO]->(b:Artist)
RETURN a.nome AS artist, b.nome AS related, r.score AS score
ORDER BY score DESC;
