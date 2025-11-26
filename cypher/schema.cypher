CREATE INDEX user_country_idx IF NOT EXISTS FOR (u:User) ON (u.pais);
CREATE INDEX track_title_idx IF NOT EXISTS FOR (t:Track) ON (t.titulo);
CREATE INDEX artist_name_idx IF NOT EXISTS FOR (a:Artist) ON (a.nome);
