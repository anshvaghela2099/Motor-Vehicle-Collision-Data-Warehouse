# **Motor Vehicle Collisions/Crashes Analysis through Data Warehouse**

## **Overview**
The project focuses on analyzing **motor vehicle collision data** from three major cities: **New York, Chicago, and Austin**.

By implementing a **Data Warehouse (DW) solution**, this project enables structured storage, transformation, and visualization of traffic accident data, allowing for **data-driven insights into accident patterns, risk factors, and safety measures**. The solution follows an **ETL (Extract, Transform, Load) workflow**, utilizing **SQL Server, Talend, Power BI, and Tableau** to generate analytical reports.

---

## **Table of Contents**
- [Project Overview](#project-overview)
- [Data Sources](#data-sources)
- [Project Phases](#project-phases)
  - [Part 1: Data Profiling and Staging](#part-1-data-profiling-and-staging)
  - [Part 2: Staging to Integration](#part-2-staging-to-integration)
  - [Part 3: Business Intelligence Dashboards](#part-3-business-intelligence-dashboards)
- [Reports and Analysis](#reports-and-analysis)
- [Author](#author)

---

## **Project Overview**
This project aims to **analyze motor vehicle crash data** and generate insights into **accident frequency, injury/fatality rates, and common causes of collisions**. The project follows a **structured ETL workflow**, extracting raw crash data, transforming it into a meaningful format, and loading it into a **data warehouse optimized for reporting**.

### **Key Objectives**
- **Standardizing crash data** from three different city datasets (**New York, Chicago, Austin**).
- **Building a scalable Data Warehouse** using **Talend & SQL Server**.
- **Analyzing accident patterns** based on time, location, and contributing factors.
- **Developing interactive dashboards** using **Power BI and Tableau**.
- **Identifying high-risk locations and common accident causes**.

### **Key Analysis Areas**
- **Total number of accidents** in each city.
- **Top 3 high-accident areas** in each city.
- **Accidents resulting in injuries and fatalities** (overall and city-specific).
- **Pedestrian involvement in crashes** (overall and by city).
- **Temporal analysis of accidents** (time of day, day of the week, seasonality).
- **Motorists' injury and fatality statistics**.
- **Common contributing factors to accidents**.

---

## **Data Sources**
The dataset is sourced from publicly available **Department of Transportation (DoT) data portals**:

### **New York City**
- [NYC Motor Vehicle Collisions - Crashes](https://data.cityofnewyork.us/Public-Safety/Motor-Vehicle-Collisions-Crashes/h9gi-nx95/about_data)

### **Chicago**
- [Chicago Traffic Crashes - Crashes](https://data.cityofchicago.org/Transportation/Traffic-Crashes-Crashes/85ca-t3if/about_data)

### **Austin**
- [Austin Crash Report Data - Crash Level Records](https://data.austintexas.gov/Transportation-and-Mobility/Austin-Crash-Report-Data-Crash-Level-Records/y2wy-tgr5/about_data)

---

## **Project Phases**

### **Part 1: Data Profiling and Staging**
1. **Extract Data**
   - Downloaded traffic accident data from **New York, Chicago, and Austin Open Data Portals**.
   - Standardized data formats for consistency.

2. **Data Profiling**
   - Used **Ydata Profiling and Alteryx** to analyze missing values, duplicate records, and schema differences.
   - Identified **data quality issues** such as:
     - Null values in location coordinates.
     - Inconsistent time formats across datasets.
     - Multi-valued attributes (e.g., multiple contributing factors per accident).

3. **Create Staging Tables**
   - Created **staging tables (`stg_*`)** in **SQL Server**.
   - Added **audit columns**:
     - `DI_CreateDate`: Timestamp of row load.
     - `DI_WorkflowFileName`: Name of the Alteryx workflow processing the data.

4. **Deliverables**
   - Screenshots of **Alteryx workflow**.
   - **Runtime details** of ETL job execution.
   - **DDL script for staging tables**.
   - **Data profiling report** documenting:
     - Differences in schema between the three cities.
     - Strategies for merging the datasets.

---

### **Part 2: Staging to Integration**
1. **ETL Process Using Talend**
   - Extracted data from **staging tables (`stg_*`)**.
   - Transformed data and applied **business rules**.
   - Loaded into **integration schema (`dim_*, fact_*`)**.

2. **Dimensional Model**
   - **Fact Table:** `fact_accidents`
   - **Dimension Tables:**
     - `dim_location`
     - `dim_time`
     - `dim_vehicle`
     - `dim_contributing_factor`
     - `dim_pedestrian_involvement`

  ![image](https://github.com/user-attachments/assets/ff9fcd92-8e52-4d19-9cf8-0e48b6dc7bfd)


3. **Change Request Implementation**
   - Adjusted the **dimensional model** for adding **SCDs** and **Factless Fact** to accomodate additional business requirements

    ![image](https://github.com/user-attachments/assets/978e7120-4533-4e35-9bb6-8170fa6cd4de)


4. **Data Validation**
   - Ensured **row counts** matched between source and destination.
   - Used SQL queries to validate **data consistency and rejection logs**.

5. **Deliverables**
   - **Talend job files**.
   - **Screenshots of ETL process**.
   - **SQL scripts for validation**.
   - **Before-and-after row count comparisons**.

---

### **Part 3: Business Intelligence Dashboards**
1. **Visualization Tools**
   - Created **Power BI** and **Tableau** dashboards.
   - Published to **Power BI Service** and **Tableau Online**.

2. **Key Dashboards**
   - **Accident Frequency Analysis**
   - **Top 3 Accident-Prone Areas in Each City**
   - **Injury and Fatality Statistics**
   - **Pedestrian Involvement Analysis**
   - **Temporal Analysis of Accidents**
   - **Contributing Factors Report**

![image](https://github.com/user-attachments/assets/fc4a7b17-0c61-4c8b-800e-d7fa32e2a430)

![image](https://github.com/user-attachments/assets/aa248b24-371d-4a9c-bc0f-eff24e85f785)

![image](https://github.com/user-attachments/assets/18ad7f49-59d6-4255-a7c5-001180bf949d)


3. **Deliverables**
   - **Screenshots of dashboards**.
   - **Power BI and Tableau workbooks**.

---

## **Reports and Analysis**
### **Key Insights**
- **Top accident-prone areas** in New York, Chicago, and Austin.
- **Peak times for accidents** (weekday vs. weekend patterns).
- **Most common contributing factors** (speeding, distracted driving, etc.).
- **Pedestrian involvement trends**.
- **Seasonal variations in accident frequency**.

---

## **Author**
**Ansh Vaghela**  
[LinkedIn](https://www.linkedin.com/in/anshv1/)  
