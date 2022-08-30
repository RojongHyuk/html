use htmldb;
create table users(
	userid varchar(20) not null primary key,
    username varchar(100) not null,
    email varchar(100)
);

desc users;

create table posts(
	id int auto_increment not null primary key,
    userid varchar(20) not null,
    title varchar(1000) not null,
    body varchar(2000),
    foreign key(userid) references users(userid)
);

desc posts;

insert into users(userid,username,email)
values('blue','pass','blue@icia.com');
insert into users(userid,username,email)
values('red','pass','red@icia.com');
insert into users(userid,username,email)
values('green','pass','green@icia.com');

select * from users;

insert into posts(title, body, userid)
values('새로운 도전을 시작한 당신을 위한 멘토 프로그램!', 'iT취업 도전하겠다고 결심했지만, 여전히 취업은 막막하고 고민되시죠?','blue');
insert into posts(title, body, userid)
values('코로나 19를 이겨내자!!','수강생 여러분의 취업을 위해 icia가 돕겠습니다.','red');
insert into posts(title, body, userid)
values('코로나19','2.5단계 시행','green');

select count(*) from posts;

insert into posts(title,body,userid)
select title,body,userid from posts;


select *from posts
where title like '%%'
order by id desc
limit 6,5;

