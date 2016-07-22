create table Following
(
[user_id] varchar(25) constraint fk_userid foreign key references UserDetail([user_id]) ,
following_id varchar(25) constraint fk_followingid foreign key references UserDetail([user_id]) ,
)

drop table Following
 
create procedure followingProcedure @userid varchar(25),@followingid varchar(25)
as
begin
insert into Following([user_id] ,following_id)
values(@userid,@followingid)
end
go

drop table UserDetail

create table Tweet
(
Tweet_Id int identity constraint pk_tweetid primary key,
[user_id] varchar(25) constraint fk_tweetuserid foreign key references UserDetail([user_id]),
[Message] varchar(130) not null,
Created datetime default sysdatetime(),
TweepleImage varbinary(max))

create proc insertTweet @user_id varchar(25),@Message varchar(130),@TweepleImage varbinary(max)
as
begin
insert into Tweet()
end

drop table Tweet

create table UserDetail
(
[user_id] varchar(25) constraint cnpk primary key ,
[password] varchar(50) not null,
FirstName varchar(30) not null,
LastName varchar(30) not null,
Email varchar(50) unique,
City varchar(30),
MobileNo varchar(30) constraint chk_Mobile check(MobileNo between 7000000000 and 9999999999 ),
joined datetime default SYSDATETIME(),
active bit not null default 1)

drop table UserDetail
create procedure insertSignUpData @userid varchar(25),@psw varchar(50),@frstname varchar(30),@lstname varchar(30),@email varchar(50),@city varchar(30),
@mobileno varchar(30)
as
begin
insert into UserDetail([user_id],[password],FirstName,LastName,Email,City,MobileNo)
values(@userid,@psw,@frstname,@lstname,@email,@city,@mobileno)
end
go