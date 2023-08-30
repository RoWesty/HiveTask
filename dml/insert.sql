LOAD DATA INPATH '/user/rowest/people.csv' INTO TABLE people_temp;
LOAD DATA INPATH '/user/rowest/organizations.csv' INTO TABLE organizations_temp;
LOAD DATA INPATH '/user/rowest/customers.csv' INTO TABLE customers_temp;

INSERT INTO customers PARTITION(subscriptions_year)
select * from customers_temp;

INSERT INTO organizations PARTITION(founded_age)
select * from organizations_temp;

INSERT INTO people PARTITION(age_group)
select * from people_temp;