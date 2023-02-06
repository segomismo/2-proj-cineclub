select first_name, last_name, name, count(*) as veces
from actors as a
left join actorsfilms as af
on af.actor_id = a.actor_id
left join films as f
on f.film_id = af.film_id
left join categorysfilms as cf
on f.film_id = cf.film_id
left join categorys as c
on cf.category_id = c.category_id
group by a.first_name, last_name, name;

/*
1. con esta query sacamos la cantidad de veces que un actor ha hecho un tipo de categoria de pelicula
*/

select name, count(name) as veces_que_se_repite
from categorys as c
left join categorysfilms as cf
on cf.category_id = c.category_id
left join films as f
on f.film_id = cf.film_id
group by name
order by count(name) desc
limit 1;

/*
2. con esta query sacamos cual es la moda de las categorias
*/

select title, count(*) as inventory_films
from films as f
left join inventory as i
on f.film_id=i.film_id
group by title;

/* 
3. cantidad de peliculas que tenemos de cada una en inventario
*/
select name, avg(length) as "duración media"
from categorys as c
left join categorysfilms as cf
on c.category_id = cf.category_id 
left join films as f
on f.film_id = cf.film_id
where name = "animation"
;

/*
4.duracion media de la categoria animation, que es la moda
*/

select first_name, last_name, count(*) as veces
from actors as a
left join actorsfilms as af
on a.actor_id = af.actor_id
left join films as f
on af.film_id = f.film_id
group by first_name, last_name
order by count(*) desc
limit 15;

/*
5.la actriz que aparece en mas peliculas y cuantas veces aparece
*/
select a.actor_id as Actor_id, first_name, last_name, name, count(name) as "veces en categoria"
from actors as a
left join actorsfilms as af
on a.actor_id=af.actor_id
left join films as f
on f.film_id=af.film_id
left join categorysfilms as cf
on cf.film_id=f.film_id
left join categorys as c
on cf.category_id=c.category_id
where a.actor_id=23
group by name, first_name, last_name, Actor_id
order by count(name) desc
;
/*
6.veces que la actriz de moda aparece en cada categoria ordenador de forma descendente
*/

select title, replacement_cost 
from films
where replacement_cost < 25 and replacement_cost > 20
order by replacement_cost asc;

/*
7.esto lo que hace es seleccionar las peliculas cuyo valor de reemplazo es entre 20 y 25
*/

select title, replacement_cost as "valor maximo de reemplazo"
from films
where replacement_cost = (select max(replacement_cost) from films)
;
/*
8.esto lo que hace es seleccionar las peliculas que mas cuesta el reemplazo
*/

select rating, title, l.name
from films as f
left join language as l
on f.language_id = l.language_id
where l.name != "Italian" and f.rating = "G"
;
/*
este busca las peliculas cuyo idioma sea diferente del italiano y el rating sea "G"
*/