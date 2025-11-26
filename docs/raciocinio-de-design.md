## Objetivos
- Demonstrar recomendações baseadas em grafos com sinais explícitos (likes/follows) e implícitos (listens).
- Cobrir consultas sobre gêneros, artistas relacionados e vizinhança por comportamento.

## Decisões
- **Separação de sinais:** `LISTENED` ≠ `LIKED`. Likes têm mais peso sem precisar codificar pontuação; as consultas os tratam como preferências fortes.
- **Similaridade entre artistas (`RELATED_TO`):** inclui `score` para controlar o corte mínimo nas recomendações.
- **Explicabilidade:** consultas retornam caminhos que justificam recomendações (da origem do interesse até a faixa).

## Alternativas futuras
- **Pesos e recência:** ponderar listens por idade (`duration` e `timestamp`).
- **Desambiguação de gêneros:** muitos-to-many com subgêneros.
- **Métricas:** precisão, NDCG, cobertura por usuário e diversidade.
