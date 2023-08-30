CREATE TABLE IF NOT EXISTS customers(
    indexs INT, 
    Customer_id STRING, 
    First_Name VARCHAR(60), 
    Last_Name VARCHAR(60), 
    Company VARCHAR(120), 
    City VARCHAR(90), 
    Country VARCHAR(80), 
    Phone_1 VARCHAR(200), 
    Phone_2 VARCHAR(200), 
    Email VARCHAR(140), 
    Subscription_Date DATE, 
    Website VARCHAR(160))
PARTITIONED BY (subscriptions_Year SMALLINT)
row format delimited fields terminated by ',';

CREATE TABLE IF NOT EXISTS customers_temp(indexs INT, 
    Customer_id STRING, 
    First_Name VARCHAR(60),
    Last_Name VARCHAR(60), 
    Company VARCHAR(120), 
    City VARCHAR(90), 
    Country VARCHAR(80), 
    Phone_1 VARCHAR(200), 
    Phone_2 VARCHAR(200), 
    Email VARCHAR(140), 
    Subscription_Date DATE, 
    Website VARCHAR(160),
    subscriptions_Year SMALLINT)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "escapeChar"    = "'"
)
tblproperties("skip.header.line.count"="1");

CREATE TABLE IF NOT EXISTS organizations(
    indexs INT, 
    Organization_id STRING, 
    Name VARCHAR(90), 
    Website VARCHAR(120), 
    Country VARCHAR(120), 
    Descriptions VARCHAR(120),
    Founded SMALLINT, 
    Industry VARCHAR(150), 
    Number_of_employees SMALLINT)
PARTITIONED BY (Founded_Age VARCHAR(15))
row format delimited fields terminated by ',';

CREATE TABLE IF NOT EXISTS organizations_temp(indexs INT,
    Organization_id STRING, 
    Name VARCHAR(90), 
    Website VARCHAR(120), 
    Country VARCHAR(120), 
    Descriptions VARCHAR(120), 
    Founded SMALLINT,
    Industry VARCHAR(150), 
    Number_of_employees SMALLINT,
    Founded_Age VARCHAR(15))
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "escapeChar"    = "'"
)
tblproperties("skip.header.line.count"="1");

CREATE TABLE IF NOT EXISTS people(
    Indexs INT,
    User_id STRING,
    First_Name VARCHAR(60),
    Last_Name VARCHAR(60),
    Sex VARCHAR(8),
    Email VARCHAR(140),
    Phone VARCHAR(200),
    Date_of_birth DATE)
PARTITIONED BY (Age_group VARCHAR(15))
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',';

CREATE TABLE IF NOT EXISTS people_temp(
    Indexs INT,
    User_id STRING,
    First_Name VARCHAR(60),
    Last_Name VARCHAR(60),
    Sex VARCHAR(8),
    Email VARCHAR(140),
    Phone VARCHAR(200),
    Date_of_birth DATE,
    Age_group VARCHAR(15))
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "escapeChar"    = "'"
)
tblproperties("skip.header.line.count"="1");