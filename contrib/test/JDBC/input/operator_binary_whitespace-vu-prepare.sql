create view v1_bitop as select 99&+2 as c1, 88|-9 as c2, 77^~5 as c3
go
create procedure p1_bitop  as select 99&~5|-4
go
create view v1_bitop_not as select ~+2 as x
go
create procedure p1_bitop_not  as select ~+2
go
create view v1_modulo_op as select 10%-3 as x
go
create procedure p1_modulo_op as select 10%+2
go
create view v1_bitop_all as select c1=99&-5,99&+5 c2,99&~5 c3,c4=99&-5,c5=99&+5,c6=99&~5,c7=88|-~+2,88|+~+2 as c8,c9=88|~~+2,77^-~+2 c10,77^+~+2 c11,c12=77^~~+2,c13=+~+2,~-2 as c14,c15=+~-2-~-2,c16=~~~~~2,c17=+~~~~~-2,10%-3 c18,10%+3 as c19,c20=10%3,100%@@max_precision c21
go
create procedure p1_bitop_all as select 99&-5,99&+5,99&~5,99&-5,99&+5,99&~5,88|-~+2,88|+~+2,88|~~+2,77^-~+2,77^+~+2,77^~~+2,+~+2,~-2,+~-2-~-2,~~~~~2,+~~~~~-2,10%-3,10%+3,10%3,100%@@max_precision
go