/*QUESTÃO 2
Dentre os top 16 filmes mais alugados, qual o nome completo do ator mais presente nesses filmes?

Saída esperada: 1 coluna e 1 linha com o nome completo.*/

 SELECT concat(act.first_name,' ',act.last_name) as name_actor 
 from (SELECT top 1(b.actor_id), count(a.film_id) as total_actor_film
       from (select top 16(film_id), count(distinct rental_id) as qtd_rental_film 
             from (SELECT r.inventory_id, r.rental_id, ins.film_id 
                   from rental r
                   INNER JOIN inventory_store ins on r.inventory_id = ins.inventory_id) rent_inv_film
             group by film_id
             order by qtd_rental_film desc) A
       inner join film_actor b on a.film_id = b.film_id
       group by b.actor_id
       order by total_actor_film desc) result2
inner join dbo.actor act on result2.actor_id = act.actor_id

/* Utilizei subquery para selecionar os 16 filmes mais alugados e relacionei com o id de cada ator presente. 
Após isso, utilizei o concatenar para unir o nome e sobrenome do ator para reposta final.*/ 