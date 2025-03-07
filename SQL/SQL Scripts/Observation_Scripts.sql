
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = N'stg_asis_NYC'

## Count queries for New york

select count(*) as Collisions from stg_asis_NYC
select count(*) as Collisions from stg_Cleaned_NYC
select count(*) as Collisions from stg_Final_NYC

## Count queries for New york

select count(*) as Collisions from stg_asis_Chicago
select count(*) as Collisions from stg_Cleaned_Chicago
select count(*) as Collisions from stg_Final_Chicago

## Count queries for New york

select count(*) as Collisions from stg_asis_Austin
select count(*) as Collisions from stg_Cleaned_Austin
select count(*) as Collisions from stg_Final_Austin

## 
select TOP 1000 * from stg_asis_NYC 
select TOP 1000 * from stg_Cleaned_NYC
select TOP 1000 * from stg_Final_NYC
 
select TOP 1000 * from stg_asis_Chicago 
select TOP 1000 * from stg_Cleaned_Chicago 
select TOP 1000 * from stg_Final_Chicago
 
select TOP 1000 * from stg_asis_Austin 
select TOP 1000 * from stg_Cleaned_Austin 
select TOP 1000 * from stg_Final_Austin