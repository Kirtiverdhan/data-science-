 is the senior most empoloyee based on the job profile

select * from employee
order by levels desc
limit 1

2 Which country has the most invoices

select count(*) as c,billing_country from invoice
group by billing_country 
order by c desc

 what are the top three values of totle invoice

select * from invoice
order by total desc
limit 3

3 which city has the besst customers ? we would like to throw a promotional music
festival in the city wee made the most money write a query
that return one city that has the most higest sum of invoice totals
return total both city name and sum of all invoice totals

select sum(total) as  invoice_total, billing_city 
from invoice
group by billing_city
order by invoice_total desc

4 who is the best customer ? the customer who has spend the most money 
will be declard the best customer . write a query that return 
the person that spend the most money?

select customer.customer_id, first_name, last_name, sum(invoice.total) as total
from customer
join invoice
on customer.customer_id = invoice.customer_id
group by customer.customer_id
order by total desc
limit 1

5 write query to return the email, first name last name
and genre of all rock music listeners . return list irderd alphabeticaly
by email starting with a 

select distinct first_name, last_name, email 
from customer
join invoice on customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id =invoice_line.invoice_id
where track_id in(
	select track_id from track
	join genre on track.genre_id = genre.genre_id
	where genre.name like 'Rock'
)
order by email;

 6 lets invit a artists who have writion most of rock music a
in our databsee . write query that return the artists name
and total track count of top 10 rock bands

select artist.artist_id, artist.name, count(artist.artist_id) as number_of_songs
from track
join album on album.album_id = track.album_id
join artist on artist.artist_id = album.artist_id
join genre on genre.genre_id = track.genre_id
where genre.name like 'Rock'
group by artist.artist_id
order by number_of_songs
limit 10;

7 Return all track names that have song lenth longer then 
the average song lenth. return the name and milliseconds
each track . order by song length with the longest songs first.

	
select track.name , track.milliseconds from  track
where milliseconds > (
	select avg(milliseconds) as avg_track_length
	from track)
order by milliseconds desc;

 #ADVANCE
8 Find how much amountspend by each coustomer on artists?
query to return customer name, artisr=t name and total spend.


with best_selling_artist as(
	 select artist.artist_id as artist_id , artist.name as artist_name
	 sum(invoice_line.unit_price * invoice_line_quantity) as total_sales
	 from invoice_line
	 
)



