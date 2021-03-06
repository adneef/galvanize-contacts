/* 1
select first_name, last_name
from users
where date_of_birth like '%20%'
order by last_name desc;
*/

/* 2
select biography
from users
where biography like '% man %';
*/

/* 3
select first_name, last_name, type, value
from users
inner join contacts on user.id = contacts.user_id
where first_name = 'Danny';
*/

/* 4
select first_name
from users
where first_name = 'Kyle' or first_name = 'Danny';
*/

/* 5
select first_name, last_name, count(user_id) as number_contacts
from users
inner join contacts on users.id = contacts.user_id
group by first_name, last_name, user_id;
*/
