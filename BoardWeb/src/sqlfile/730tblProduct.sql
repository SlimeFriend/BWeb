-- ��ǰ�ڵ�, ��ǰ��, ����, ���� (x), �̹��� 
create table tbl_product(
 prod_code varchar2(30),
 prod_name varchar2(100),
 prod_price number,
 prod_description varchar2(1000),
 prod_image varchar2(100)
);

insert into tbl_product {prod_code, prod_name, prod_price, prod_image}
values 