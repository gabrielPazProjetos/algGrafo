--- Algoritmo de Recomendação de Músicas com Grafos (Neo4j + Cypher) Este projeto foi desenvolvido com o objetivo é construir um sistema de recomendação que utiliza grafos para identificar padrões de escuta e sugerir novas faixas aos usuários.
--- O que o projeto cobre -
-- Modelagem em grafos:

Nós: User, Track, Artist, Genre
Relacionamentos: LISTENED, LIKED, FOLLOWS, BY, IN_GENRE, RELATED_TO
Propriedades em arestas: timestamp, device, since, score

-- Carga de dados sintéticos:
Usuários fictícios
Artistas e músicas inventadas
Gêneros musicais genéricos
Interações de escuta, curtida e seguir

-- Consultas Cypher de recomendação:
Por gênero favorito
Por artistas relacionados
Colaborativa por comportamento (usuários vizinhos)
Explicabilidade (caminho que justifica a recomendação)

-- Documentação:
docs/modelagem.md → descreve a modelagem
docs/raciocinio-de-design.md → explica as decisões de design

--- Nota
Para gerar o grafico Neo4j, basta exportar o modelo presente neste repositorio.
docs/exemplos-de-resultados.md → mostra saídas das consultas

--- Exemplos de consultas -- Recomendação por gênero -- Sugere faixas em gêneros que o usuário mais escuta:
cypher MATCH (u:User {userId:'u1'})-[:LISTENED]->(t:Track)-[:IN_GENRE]->(g:Genre) WITH u, g, count(*) AS listens ORDER BY listens DESC LIMIT 2 MATCH (g)<-[:IN_GENRE]-(rec:Track) WHERE NOT EXISTS { MATCH (u)-[:LISTENED]->(rec) } RETURN rec.titulo AS faixa, g.nome AS genero;
