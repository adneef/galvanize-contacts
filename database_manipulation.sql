/* 1
alter table users
add column is_human boolean;
*/

/* 2
update users
set is_human = true
where first_name = 'Kyle' or first_name = 'CJ' or first_name = 'Roberto';
*/

/* 2 still
update users
set is_human = false
where first_name = 'Danny';
*/

/* 3
delete from users
where is_human = true;
*/

/* 4
drop table contacts;
*/
