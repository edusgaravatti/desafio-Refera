/*QUESTÃO 3
Quantos clientes novos a empresa adquiriu por mês? Considere a data de início de um novo cliente como sendo a data do primeiro filme que esse cliente alugou.

Saída esperada: 2 colunas ( mês_entrada_cliente:date | quantidade_de_clientes:int ) e 3 linhas.*/

select data_mes, count(customer_id) as qtd_clientes 
	from (select customer_id, cast(concat(YEAR(data_inicio_cliente),'-',MONTH(data_inicio_cliente),'-','01') as date) as data_mes
		 from (SELECT customer_id,min(rental_date) as data_inicio_cliente FROM RENTAL
		 group by customer_id) A) B
group by data_mes
order by data_mes


/* Foi utilizado subquery para encontrar o numero de clientes por data, e posteriormente transformei a data numa contagem por mes e ano.
Obs: para manter em formato de data, utilizei o dia primeiro(01) de maneira ficticia.*/