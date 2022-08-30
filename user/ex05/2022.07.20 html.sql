create table posts(
	id int auto_increment not null primary key,
    title varchar(500) not null,
    userid varchar(20) not null,
    body varchar(2000) not null,
    wdate datetime default now()
);

desc posts;

insert into posts(title,userid,body)
values('전주일보아카데미','red','전주전주전주전주전주전주전주');
insert into posts(title,userid,body)
values('강릉일보아카데미','blue','강릉강릉강릉강릉강릉강릉강릉');
insert into posts(title,userid,body)
values('부산일보아카데미','green','부산부산부산부산부산부산부산');
insert into posts(title,userid,body)
values('인천일보아카데미','blue','인천인천인천인천인천인천인천');
insert into posts(title,userid,body)
values('서울일보아카데미','red','서울서울서울서울서울서울서울');

select * from posts;

create table users(
	userid varchar(20) not null primary key,
    username varchar(20) not null,
    email varchar(50) not null,
    address varchar(200)
);

insert into users(userid,username,email,address)
values('red','홍길동','red@icia.com','인천 미추홀구');
insert into users(userid,username,email,address)
values('blue','심청이','blue@icia.com','인천 서구');
insert into users(userid,username,email,address)
values('green','강감찬','green@icia.com','인천 남동구');
insert into users(userid,username,email,address)
values('pink','이몽룡','pink@icia.com','인천 계양구');

select *from users;

alter table posts add foreign key(userid) references users(userid);

select * from posts;

create view view_posts as 
select posts.*,username,address,email from posts,users where posts.userid=users.userid;

select * from view_posts
where username like '%%'
order by username; 

drop view view_posts;

create view view_posts as
select posts.*,username,email,address
from users,posts
where users.userid=posts.userid;

select * from view_posts;

select * from posts where userid='red';

select *,date_format(wdate,"%Y-%m-%d %T") fdate 
from view_posts
order by id desc
limit 0,8;

insert into posts(title,userid,body)
select title, userid, body from posts;

select count(*) cnt from posts;

create table comments(
	id int auto_increment primary key,
    postid int not null,
    body varchar(2000) not null,
    userid varchar(20) not null,
	foreign key(postid) references posts(id),
    foreign key(userid) references users(userid)
);

insert into comments(postid,userid,body)
values(250,'green','test1');
insert into comments(postid,userid,body)
values(249,'red','test2');
insert into comments(postid,userid,body)
values(250,'blue','test3');

insert into comments(postid,userid,body)
values(249,'green','test1');
insert into comments(postid,userid,body)
values(250,'red','test2');
insert into comments(postid,userid,body)
values(249,'blue','test3');

create view view_comments as
select c.*,username,email,address 
from comments c,users u
where c.userid=u.userid;

select * from view_comments where postid=250;

update posts set title='jhjhjkkjh',body='hjhgh',wdate=now() where id='red';

select * from view_comments where postid='250' order by id desc;

delete from posts where id>0;

create table books(
	code int auto_increment primary key,
    title varchar(200) not null,
    image varchar(200) not null,
    price int default 0,
    rdate datetime default now(),
    contents varchar(2000),
    userid varchar(20) not null, /*등록자*/
    qnt int default 0,
    foreign key(userid) references users(userid)
);

drop table books;
desc books;

insert into books(title,image,price,userid)
values("받침 없는 한글 동화 : 무시무시 마녀가 이사 와!","new1.jpg",12420,'red');
insert into books(title,image,price,userid)
values("받침 없는 한글 동화 : 도, 도, 도깨비다!","new2.jpg",12420,'red');
insert into books(title,image,price,userid)
values("받침 없는 한글 동화 : 바쁘다 바빠 너구리 바빠","new3.jpg",12420,'red');
insert into books(title,image,price,userid)
values("받침 없는 한글 동화 : 도깨비 파자마 파티","new4.jpg",12420,'red');
insert into books(title,image,price,userid)
values("받침 없는 한글 동화 : 4권 세트","new5.jpg",12420,'red');

insert into books(title,image,price,userid)
values("구글 엔지니어는 이렇게 일한다","best1.jpg",40500,'red');
insert into books(title,image,price,userid)
values("혼자 공부하는 머신러닝+딥러닝","best2.jpg",23400,'red');
insert into books(title,image,price,userid)
values("혼자 공부하는 C 언어","best3.jpg",21600,'red');
insert into books(title,image,price,userid)
values("변화하는 세계 질서","best4.jpg",34200,'red');
insert into books(title,image,price,userid)
values("이것이 취업을 위한 코딩 테스트다 with 파이썬","best5.jpg",30600,'red');

select * from books;

insert into books(title,image,price,userid)
select title,image,price,userid from books;

select count(*) from books;

update books set contents ='<받침 없는 한글 동화>는 재미있는 두 편의 이야기를 부모님과 아이가 주고받으며 읽는 책입니다. 한글 습득 원리에 따라 기획되어 읽다 보면 저절로 읽기 독립이 완성되지요. 아이가 받침 없는 글자만 읽어도 이야기를 이해할 수 있도록 구성하였습니다. 이야기를 반복해서 듣고 따라 읽으며 아이 스스로 읽기에 대한 재미와 성취감을 느낄 수 있게 해 주세요.' where code>0;

desc users;
select*from users;

alter table users add column password varchar(20) default 'pass' not null;

alter table users add column photo varchar(100);

update users set photo='photo1..jpg' where userid='red';

select * from users where userid='pink';

select * from books;

delete from books where code >10;

update books set qnt=120 where code=1;
update books set qnt=105 where code=2;
update books set qnt=85 where code=3;
update books set qnt=65 where code=4;
update books set qnt=125 where code=5;
update books set qnt=45 where code=6;
update books set qnt=95 where code=7;
update books set qnt=77 where code=8;
update books set qnt=62 where code=9;
update books set qnt=100 where code=10;

desc books;

insert into books(title,image,price,contents,userid)
select title,image,price,contents,userid from books;

select count(*) from books;