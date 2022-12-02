/*QUESTÃO 1
Qual foi os top 2 filmes mais alugados de todos os tempos?

Saída esperada: 2 colunas(título do filme, quantidade) e 2 linhas.*/

select title as titulo_do_filme, qtd_rental_film as total_alugueis 
from (select top 2(film_id), count(distinct rental_id) as qtd_rental_film 
      from (SELECT r.inventory_id, r.rental_id, ins.film_id 
            from rental r
            INNER JOIN inventory_store ins on r.inventory_id = ins.inventory_id) rent_inv_film
group by film_id
order by qtd_rental_film desc) result1
inner join film f on result1.film_id = f.film_id



/*Foi utilizado duas subquery, as quais serviram para auxiliar na resolução do problema. 
A primeira subquery relacionou o numero de inventario, registro de aluguel e registro do filme.
Já a segunda subquery serviu para selecionar os 2 filmes mais alugados.
E por ultimo, como só havia o id_film como resposta, relacionei com os titulos dos filmes.*/

