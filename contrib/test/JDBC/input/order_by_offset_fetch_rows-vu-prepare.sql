create table t1_order_by_offset_fetch(a int, b int)
go
insert t1_order_by_offset_fetch select generate_series, 0 from generate_series(1,100)
go
update t1_order_by_offset_fetch set b=a
go
CREATE PROC p1_order_by_offset_fetch @p int=1,@q int=1  AS SELECT * FROM t1_order_by_offset_fetch ORDER BY b OFFSET @p*@q ROWS FETCH NEXT square(@q)+1 ROWS ONLY
go
CREATE FUNCTION f1_order_by_offset_fetch(@p int, @q int) returns int as begin declare @v int SELECT @v=count(a) FROM t1_order_by_offset_fetch group by b ORDER BY b OFFSET @p*@q ROWS FETCH NEXT square(@q)+1 ROWS ONLY return @v end
go
CREATE VIEW v1_order_by_offset_fetch as select * FROM t1_order_by_offset_fetch ORDER BY b OFFSET 5 ROWS FETCH NEXT 3 rows only 
go
