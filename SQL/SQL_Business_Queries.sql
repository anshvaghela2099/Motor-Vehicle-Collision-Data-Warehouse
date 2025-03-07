/*How many accidents occurred in NYC, Austin and Chicago?*/
Select Count(*) as No_of_Accidents, d.Source from Fct_Accidents f join Dim_Source d on d.Source_SK = f.Source_SK group by d.Source

/*Which areas in the 3 cities had the greatest number of accidents?*/
Select Count(f.Location_SK), d.Source from Fct_Accidents f join Dim_Source d on d.Source_SK = f.Source_SK group by d.Source order by f.Location_SK desc

	WITH RankedAccidents AS (
    SELECT Dim_Location.STREET_NAME, Dim_Source.SOURCE,
	COUNT(Fct_Accidents.Accidents_FCT_SK) AS Total_Accidents,
    ROW_NUMBER() OVER (PARTITION BY Dim_Source.SOURCE ORDER BY COUNT(Fct_Accidents.Accidents_FCT_SK) DESC) AS Rank
    FROM Fct_Accidents
    JOIN Dim_Location ON Fct_Accidents.Location_SK = Dim_Location.Location_SK
	JOIN Dim_Source on Fct_Accidents.Source_SK = Dim_Source.Source_SK
    GROUP BY Dim_Location.STREET_NAME, Dim_Source.SOURCE
	)  SELECT STREET_NAME,SOURCE,Total_Accidents 
	FROM RankedAccidents
	WHERE Rank <= 3;



/*How many accidents resulted in just injuries?*/
select count(*) as Accidents_Injuries from Fct_Accidents f where f.Total_Killed =0 and f.Total_Injured >0

select d.Source,count(*) as Accidents from Fct_Accidents f
join Dim_Source d on d.Source_SK = f.Source_SK 
where f.Total_Killed =0 and f.Total_Injured >0
group by d.Source

/*How often are pedestrians involved in accidents?*/
select count(*) as Accidents_Pedestrians from Fct_Accidents f where f.IS_PEDESTRIAN = 'Y';

select d.Source,count(*) as Accidents_Pedestrians from Fct_Accidents f
join Dim_Source d on d.Source_SK = f.Source_SK 
where f.IS_PEDESTRIAN = 'Y'
group by d.Source

/* When do most accidents happen?
• seasonality report*/
select d.Season,count(*) as No_of_Accidents from Fct_Accidents f
join Dim_Date d on f.Date_SK = d.Date_SK
group by d.Season
order by count(*) desc

/*Final Project Details
• How many motorists are injured or killed in accidents?*/
/*Select Avg(Motorist_Injured) from Fct_Accidents

Select Count(*) from Fct_Accidents where Motorist_Killed > 0
Select Count(*) from Fct_Accidents where Motorist_Injured > 0*/
SELECT
  SUM(Motorist_Injured) AS Total_Motorist_Injuries,
  SUM(Motorist_Killed) AS Total_Motorist_Fatalities
FROM
  Fct_Accidents;

   /* Chicago doesn't have bifurcation for motorists*/

   
/*Which top 5 areas in 3 cities have the most fatal number of accidents?*/

   	WITH RankedAccidents AS (
    SELECT Dim_Location.STREET_NAME, Dim_Source.SOURCE,
	COUNT(Fct_Accidents.Accidents_FCT_SK) AS Total_Accidents,
    ROW_NUMBER() OVER (PARTITION BY Dim_Source.SOURCE ORDER BY COUNT(Fct_Accidents.Accidents_FCT_SK) DESC) AS Rank
    FROM Fct_Accidents
    JOIN Dim_Location ON Fct_Accidents.Location_SK = Dim_Location.Location_SK
	JOIN Dim_Source on Fct_Accidents.Source_SK = Dim_Source.Source_SK
    GROUP BY Dim_Location.STREET_NAME, Dim_Source.SOURCE
	)  SELECT STREET_NAME,SOURCE,Total_Accidents 
	FROM RankedAccidents
	WHERE Rank <= 5;

	/*Time based analysis of accidents
• Time of the day, day of the week, weekdays or weekends.*/
select d.[Day],count(*) as No_of_Accidents from Fct_Accidents f
join Dim_Date d on f.Date_SK = d.Date_SK
group by d.[Day]
order by No_of_Accidents


select count(*) as Weekend_Accidents from Fct_Accidents f
join Dim_Date d on f.Date_SK = d.Date_SK
where  d.[Day] > 5
 
select count(*) as Weekday_Accidents from Fct_Accidents f
join Dim_Date d on f.Date_SK = d.Date_SK
where  d.[Day] <= 5



select d.[Hour],count(*) as No_of_Accidents from Fct_Accidents f
join Dim_Time d on f.Time_SK = d.Time_SK
group by d.[Hour]


/*Fatality analysis
• Are pedestrians killed more often than road users?*/

/*Select Count(*) from Fct_Accidents where Pedestrian_Killed > 0           and Motorist_Killed = 0
Select Count(*) from Fct_Accidents where Total_Killed > 0           and Pedestrian_Killed = 0*/
SELECT
    SUM(Pedestrian_Killed) AS Total_Pedestrian_Fatalities,
    (SUM(Total_Killed) - SUM(Pedestrian_Killed)) AS Total_Other_Road_User_Fatalities
FROM
    Fct_Accidents;

/*What are the most common factors involved in accidents*/
/*select count(*), c.Description from Fct_Contribution fc
join  Fct_Accidents f  on fc.Accidents_FCT_SK = f.Accidents_FCT_SK
join Dim_Contributing_Factor_SCD c on c.SK_ID = fc.Contri_SK 
group by c.Description 
having c.Description not like 'NA'   /*given CF NA is ignored*/
order by count(*) desc*/

select TOP 10 count(*), c.Description as Most_Common_Factors from Fct_Contribution fc
join  Fct_Accidents f  on fc.Accidents_FCT_SK = f.Accidents_FCT_SK
join Dim_Contributing_Factor_SCD c on c.SK_ID = fc.Contri_SK 
group by c.Description 
  /*Top 10*/
order by count(*) desc






/*Accidents that involved more than 2 vehicles *Austin and NYC* */

 Select Count(a.Accidents_FCT_SK)as No_Of_Accidents, s.Source from Fct_Accidents a join
	Fct_Vehicle f on f.Accidents_FCT_SK = a.Accidents_FCT_SK
	Join Dim_Source s on a.Source_SK = s.Source_SK
	where f.Vehicle_Count >2
		Group by s.Source


		/*Location Trend Observations*/

		Select Count(*)  as Count_Of_Accidents, S.Source  from Fct_Accidents a join 
		Dim_Location l on a.Location_SK = l.Location_SK
		join
		Dim_Source s on a.Source_SK = s.Source_SK
		where LATITUDE = 0 and LONGITUDE =0
		group by s.Source

		
		Select Count(*) as Count_Of_Accidents, S.Source  from Fct_Accidents a join 
		Dim_Location l on a.Location_SK = l.Location_SK
		join
		Dim_Source s on a.Source_SK = s.Source_SK
		where LATITUDE = -1 and LONGITUDE =-1
		group by s.Source