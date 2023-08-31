LOAD DATA INPATH '/user/user_name/people.csv' INTO TABLE people_temp;
LOAD DATA INPATH '/user/user_name/organizations.csv' INTO TABLE organizations_temp;
LOAD DATA INPATH '/user/user_name/customers.csv' INTO TABLE customers_temp;

INSERT INTO customers PARTITION(subscriptions_year)
select * from customers_temp;

INSERT INTO organizations PARTITION(founded_age)
select * from organizations_temp;

INSERT INTO people PARTITION(age_group)
select * from people_temp;