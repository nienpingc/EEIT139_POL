insert into member (account,hashed_pwd,salt,lastname,firstname,birthday,email,phone)
values 
('admin','ABCabc123@','kkk','Leon','Chen','1905-06-09','google@gmail.com','home','0987654321','none'),
('a123','a','123','test','t','2022-02-24','a123@mail','home','12345678', null),
('b123','b','123','test','t','2011-10-10','b123@mail','home','00000000', null),
('c123','c','123','test','t','2012-10-10','c123@mail','home','00000002', null);

insert into houseOffers (wifi,tv,kitchen,refrigerator,microwave,aircon,washer)
values (1,1,1,0,1,1,1);

insert into houseRules(check_in, check_out,smoking,pet)
values ('15:00:00','10:00:00',0,0);

insert into houseinfo (account, offersNo,rulesNo)
values 
('admin',1,1),
('a123',1,1),
('b123',1,1),
('c123',1,1);


insert into orderinfo (account,orderdate)
output inserted.orderid
values ('a123',GETDATE())
insert into orderitem (orderid,houseno,chkinDate,chkoutDate,vid)
values((select orderid from orderinfo where orderid = SCOPE_IDENTITY()),1,'2022-03-06','2022-03-07',0);

insert into orderinfo (account,orderdate)
values ('b123','2022-02-25')
insert into orderitem (orderid,houseno,chkinDate,chkoutDate,vid)
values((select orderid from orderinfo where orderid = SCOPE_IDENTITY()),2,'2022-03-09','2022-03-10',0);

insert into orderinfo (account,orderdate)
values ('c123','2022-02-25')
insert into orderitem (orderid,houseno,chkinDate,chkoutDate,vid)
values((select orderid from orderinfo where orderid = SCOPE_IDENTITY()),3,'2022-03-11','2022-03-12',0);

