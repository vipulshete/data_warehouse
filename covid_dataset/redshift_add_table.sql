CREATE TABLE "fact_covid" (
  "fips" REAL,
  "province_state" TEXT,
  "country_region" TEXT,
  "confirmed" REAL,
  "deaths" REAL,
  "recovered" REAL,
  "active" REAL,
  "date" INTEGER,
  "positive" INTEGER,
  "negative" REAL,
  "hospitalized" REAL,
  "hospitalizedDischarged" REAL,
  "hospitalizedCurrently" REAL)

COPY covid_dataset.public.fact_covid FROM 's3://vipul-first-bucket/covid_data_starschema/fact_covid.csv' IAM_ROLE 'arn:aws:iam::631012481622:role/redshfit_s3_access' FORMAT AS CSV DELIMITER ',' QUOTE '"' REGION AS 'ap-south-1' IGNOREHEADER 1;

select * from fact_covid limit 20;



CREATE TABLE "dim_date" (
  "fips" REAL,
  "date" TIMESTAMP,
  "year" INTEGER,
  "month" INTEGER,
  "day_of_week" INTEGER)

COPY covid_dataset.public.dim_date FROM 's3://vipul-first-bucket/covid_data_starschema/dim_date.csv' IAM_ROLE 'arn:aws:iam::631012481622:role/redshfit_s3_access' FORMAT AS CSV DELIMITER ',' QUOTE '"' REGION AS 'ap-south-1' IGNOREHEADER 1;

select * from dim_date limit 20;



CREATE TABLE "dim_hospital" (
  "FIPS" INTEGER,
  "STATE_NAME" TEXT,
  "latitude" REAL,
  "longtitude" REAL,
  "HOSPITAL_TYPE" TEXT,
  "HOSPITAL_NAME" TEXT,
  "HQ_CITY" TEXT,
  "HQ_STATE" TEXT)

COPY covid_dataset.public.dim_hospital FROM 's3://vipul-first-bucket/covid_data_starschema/dim_hospital.csv' IAM_ROLE 'arn:aws:iam::631012481622:role/redshfit_s3_access' FORMAT AS CSV DELIMITER ',' QUOTE '"' REGION AS 'ap-south-1' IGNOREHEADER 1;

select * from dim_hospital limit 20;



CREATE TABLE "dim_region" (
  "fips" REAL,
  "province_state" TEXT,
  "country_region" TEXT,
  "latitude" REAL,
  "longitude" REAL,
  "county" TEXT,
  "state" TEXT)

COPY covid_dataset.public.dim_region FROM 's3://vipul-first-bucket/covid_data_starschema/dim_region.csv' IAM_ROLE 'arn:aws:iam::631012481622:role/redshfit_s3_access' FORMAT AS CSV DELIMITER ',' QUOTE '"' REGION AS 'ap-south-1' IGNOREHEADER 1;

select * from dim_region limit 20;
