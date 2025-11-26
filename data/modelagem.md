## Nós
- **User:** `userId` (único), `nome`, `pais`
- **Track:** `trackId` (único), `titulo`, `duracao` (segundos)
- **Artist:** `artistId` (único), `nome`
- **Genre:** `nome` (único)

## Relacionamentos
- **LISTENED:** `(User)-[:LISTENED {timestamp: datetime, device: string}]->(Track)`
  - Captura comportamento com recência e dispositivo.
- **LIKED:** `(User)-[:LIKED {timestamp: datetime}]->(Track)`
  - Sinal explícito de preferência.
- **FOLLOWS:** `(User)-[:FOLLOWS {since: date}]->(Artist)`
  - Afinidade estável com artistas.
- **BY:** `(Track)-[:BY]->(Artist)`
  - Autoria.
- **IN_GENRE:** `(Track)-[:IN_GENRE]->(Genre)`
  - Classificação por gênero.
- **RELATED_TO:** `(Artist)-[:RELATED_TO {score: float}]->(Artist)`
  - Similaridade direcional (0–1), útil para expandir recomendações.

## Racional de propriedades
- **timestamp** em `LISTENED` e `LIKED` permite estratégias por recência.
- **device** ilustra contextos (mobile/web).
- **score** em `RELATED_TO` filtra fortes conexões.

## Diagrama lógico (texto)
User ─LISTENED/LIKED→ Track ─BY→ Artist
                           └─IN_GENRE→ Genre
User ─FOLLOWS→ Artist ─RELATED_TO→ Artist
