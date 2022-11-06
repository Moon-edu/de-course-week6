CREATE database dataset;
create user dataengineer with password 'dataengineer';

\c dataset;

create table response(
    ins_name varchar(10) not null,
    duration int not null,
    log_time timestamp not null
);
CREATE INDEX btree_response on response(log_time);
ALTER TABLE response OWNER TO dataengineer;

COPY response(ins_name, duration, log_time) FROM '/dataset/response.csv' DELIMITER ',' CSV HEADER;

create table sales(
    branch varchar(30) not null,
    sales bigint not null,
    basedate timestamp not null
);
CREATE INDEX btree_sales on sales(basedate);
ALTER TABLE sales OWNER TO dataengineer;
COPY sales(branch, sales, basedate) FROM '/dataset/sales.csv' DELIMITER ',' CSV HEADER;

create table traffic(
    product varchar(100) not null,
    traffic bigint not null,
    basedate timestamp not null
);
CREATE INDEX btree_traffic on traffic(basedate);
ALTER TABLE traffic OWNER TO dataengineer;
COPY traffic(product, traffic, basedate) FROM '/dataset/traffic.csv' DELIMITER ',' CSV HEADER;

grant ALL PRIVILEGES on database dataset to dataengineer;
grant all PRIVILEGES on ALL TABLES IN SCHEMA public TO dataengineer;
