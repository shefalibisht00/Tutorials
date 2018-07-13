DROP TABLE IF EXISTS cars;
DROP TABLE IF EXISTS mycars;

CREATE EXTERNAL TABLE IF NOT EXISTS cars( 
country  STRING,
description STRING,
designation STRING,
points STRING,
price STRING,
province STRING,
taster_name STRING,
taster_twitter_handle STRING,
title STRING,
variety STRING,
winery STRING)
COMMENT 'Data about wines from a public database'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE;
LOCATION 'dtap://TenantStorage/Wine_Input_Data/wine_data.csv';

CREATE TABLE IF NOT EXISTS mycars( 
country  STRING,
description STRING,
designation STRING,
points STRING,
price STRING,
province STRING,
taster_name STRING,
taster_twitter_handle STRING,
title STRING,
variety STRING,
winery STRING)
COMMENT 'Data about wines from a public database'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS ORC;

INSERT OVERWRITE TABLE mycars SELECT * FROM cars;

INSERT OVERWRITE DIRECTORY 'dtap://TenantStorage/Wine_Output_Data' 
select * from mycars limit 3;

