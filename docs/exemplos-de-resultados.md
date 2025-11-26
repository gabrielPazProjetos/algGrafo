## Recomendação por gênero (userId=u1)
faixa                | genero
---------------------|--------
Ruas de Recife       | MPB
Maré Alta            | MPB
Café com Vento       | Pop

## Por artista relacionado (userId=u1, minScore=0.5)
seguido        | similar      | score | faixa
---------------|--------------|-------|-----------------
Banda Aurora   | Luna Gomes   | 0.72  | Café com Vento
Banda Aurora   | Luna Gomes   | 0.68  | Ruas de Recife

## Colaborativa por comportamento (userId=u1)
vizinho | faixa             | afinidade
--------|-------------------|----------
u2      | Café com Vento    | 1
u3      | Maré Alta         | 0

## Explicabilidade (caminho principal)
faixa             | origem        | similar      | score
------------------|---------------|--------------|------
Café com Vento    | Banda Aurora  | Luna Gomes   | 0.72
