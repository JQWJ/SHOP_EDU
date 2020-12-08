create table product (
    product_id number(10) not null,
    name varchar2(40),
    price number(10),
    category_id number(10),
    constraint PK_PRODUCT primary key (product_id)
);

create table category (
    category_id number(10) not null,
    name varchar2(20),
    constraint PK_CATEGORY primary key (category_id)
);

create table sale (
    sale_id number(10) not null,
    product_id number(10) not null,
    purchase_date date,
    sale_price number(10) not null,
    amount number(5) not null,
    constraint PK_SALE primary key (sale_id)
);

