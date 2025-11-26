// Gêneros
MERGE (:Genre {nome: 'Rock'});
MERGE (:Genre {nome: 'Pop'});
MERGE (:Genre {nome: 'MPB'});
MERGE (:Genre {nome: 'Sertanejo'});

// Artistas
MERGE (:Artist {artistId:'a1', nome:'Banda Aurora'});
MERGE (:Artist {artistId:'a2', nome:'Luna Gomes'});
MERGE (:Artist {artistId:'a3', nome:'Trio Sertão'});
MERGE (:Artist {artistId:'a4', nome:'Coro do Mar'});

// Faixas
MERGE (:Track {trackId:'t1', titulo:'Estrelas na Janela', duracao: 210});
MERGE (:Track {trackId:'t2', titulo:'Noite Elétrica', duracao: 185});
MERGE (:Track {trackId:'t3', titulo:'Café com Vento', duracao: 242});
MERGE (:Track {trackId:'t4', titulo:'Ruas de Recife', duracao: 200});
MERGE (:Track {trackId:'t5', titulo:'Maré Alta', duracao: 230});
MERGE (:Track {trackId:'t6', titulo:'Serra e Céu', duracao: 215});
MERGE (:Track {trackId:'t7', titulo:'Horizonte Azul', duracao: 205});

// Relacionamentos de autoria e gênero
MATCH (a1:Artist {artistId:'a1'}), (a2:Artist {artistId:'a2'}), (a3:Artist {artistId:'a3'}), (a4:Artist {artistId:'a4'}),
      (rock:Genre {nome:'Rock'}), (pop:Genre {nome:'Pop'}), (mpb:Genre {nome:'MPB'}), (ser:Genre {nome:'Sertanejo'}),
      (t1:Track {trackId:'t1'}), (t2:Track {trackId:'t2'}), (t3:Track {trackId:'t3'}),
      (t4:Track {trackId:'t4'}), (t5:Track {trackId:'t5'}), (t6:Track {trackId:'t6'}), (t7:Track {trackId:'t7'})
MERGE (t1)-[:BY]->(a1)
MERGE (t2)-[:BY]->(a1)
MERGE (t3)-[:BY]->(a2)
MERGE (t4)-[:BY]->(a2)
MERGE (t5)-[:BY]->(a4)
MERGE (t6)-[:BY]->(a3)
MERGE (t7)-[:BY]->(a3)
MERGE (t1)-[:IN_GENRE]->(rock)
MERGE (t2)-[:IN_GENRE]->(rock)
MERGE (t3)-[:IN_GENRE]->(pop)
MERGE (t4)-[:IN_GENRE]->(mpb)
MERGE (t5)-[:IN_GENRE]->(mpb)
MERGE (t6)-[:IN_GENRE]->(ser)
MERGE (t7)-[:IN_GENRE]->(ser);

// Usuários
MERGE (:User {userId:'u1', nome:'Ana', pais:'BR'});
MERGE (:User {userId:'u2', nome:'Bruno', pais:'BR'});
MERGE (:User {userId:'u3', nome:'Carla', pais:'BR'});
MERGE (:User {userId:'u4', nome:'Diego', pais:'BR'});

// Interações de escuta/curtida/seguir
MATCH (u1:User {userId:'u1'}), (u2:User {userId:'u2'}), (u3:User {userId:'u3'}), (u4:User {userId:'u4'}),
      (t1:Track {trackId:'t1'}), (t2:Track {trackId:'t2'}), (t3:Track {trackId:'t3'}),
      (t4:Track {trackId:'t4'}), (t5:Track {trackId:'t5'}), (t6:Track {trackId:'t6'}), (t7:Track {trackId:'t7'}),
      (a1:Artist {artistId:'a1'}), (a2:Artist {artistId:'a2'}), (a3:Artist {artistId:'a3'}), (a4:Artist {artistId:'a4'})

// u1
MERGE (u1)-[:LISTENED {timestamp: datetime('2025-11-20T10:00:00'), device:'mobile'}]->(t1)
MERGE (u1)-[:LISTENED {timestamp: datetime('2025-11-20T10:30:00'), device:'mobile'}]->(t2)
MERGE (u1)-[:LIKED {timestamp: datetime('2025-11-20T11:00:00')}]->(t1)
MERGE (u1)-[:FOLLOWS {since: date('2024-06-01')}]->(a1)

// u2
MERGE (u2)-[:LISTENED {timestamp: datetime('2025-11-21T09:00:00'), device:'web'}]->(t3)
MERGE (u2)-[:LIKED {timestamp: datetime('2025-11-21T09:05:00')}]->(t3)
MERGE (u2)-[:FOLLOWS {since: date('2023-02-10')}]->(a2)

// u3
MERGE (u3)-[:LISTENED {timestamp: datetime('2025-11-22T20:15:00'), device:'mobile'}]->(t4)
MERGE (u3)-[:LISTENED {timestamp: datetime('2025-11-22T20:40:00'), device:'mobile'}]->(t5)
MERGE (u3)-[:LIKED {timestamp: datetime('2025-11-22T21:00:00')}]->(t5)
MERGE (u3)-[:FOLLOWS {since: date('2025-05-01')}]->(a2)
MERGE (u3)-[:FOLLOWS {since: date('2025-05-01')}]->(a3)

// u4
MERGE (u4)-[:LISTENED {timestamp: datetime('2025-11-23T08:10:00'), device:'web'}]->(t6)
MERGE (u4)-[:LISTENED {timestamp: datetime('2025-11-23T08:30:00'), device:'web'}]->(t7)
MERGE (u4)-[:LIKED {timestamp: datetime('2025-11-23T08:50:00')}]->(t7)
MERGE (u4)-[:FOLLOWS {since: date('2024-01-15')}]->(a3)

// Similaridade entre artistas
MERGE (a1)-[:RELATED_TO {score: 0.72}]->(a2)
MERGE (a2)-[:RELATED_TO {score: 0.68}]->(a1)
MERGE (a2)-[:RELATED_TO {score: 0.35}]->(a3)
MERGE (a3)-[:RELATED_TO {score: 0.40}]->(a4)
MERGE (a4)-[:RELATED_TO {score: 0.30}]->(a2);
