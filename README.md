#   silver_screen
    dbt_end_project

#   Business Problem Overview


You are a BI Analyst for a major Entertainment Company. Your company recently acquired a chain of movie theaters in New Jersey called 'Silver Screen.'
Although, 'Silver Screen' has only three movie theaters in New Jersey, management has tasked you with analyzing the efficiency of these locations. Specifically, they want to understand the relationship between movie rental costs and revenue generated.
To support this analysis, you need to create a table that summarizes monthly performance for each movie across all locations. This table should include:
Movie details
Location information
Monthly rental costs for each movie
Total ticket sales for each movie at each location
Total revenue generated from ticket sales for each movie at each location.

#   Data Sources

“Silver Screen” gathered all data in one place: https://drive.google.com/drive/folders/1HYCS_wyl_FkzcHjtoqIiNx0wNwUQhlga?usp=drive_link
Data were gathered from different sources, so it may have different formats.
Overall, “Silver Screen” provided us with 5 data sources: 

movie_catalogue -  table contains detailed information about movies released in 2024 and rented out by “Silver Screen”.

invoices -  represents the invoices issued for showing a specific movie at various theater locations during different months. Data was passed by “Silver Screen” accountants.

nj_001 - information on all transactions from location №1

nj_002 - daily sales information from location location №2

nj_003- tracks individual purchases from location №3, covering various product types such as tickets, snacks, and drinks.  

 
#   Requirements for the Final Table.
The main task of this project is to create a table that will have the following columns: 
movie_id
movie_title
genre
studio 
month
location
rental_cost
tickets_sold
revenue

# movie_catalogue
Handle missing values in the 'genre' column by replacing them with 'Unknown' to ensure data accuracy
in the final model.

# nj_001
The first location provides detailed transaction information. You'll likely need to extract the month 
from the timestamp parameter and then aggregate data by month and movie_id, summing the ticket_amount 
and transaction_total for each combination.
notion image

# nj_002
The second location presents a different scenario. While the data is already aggregated, it's currently 
at the daily level.
To ensure consistency with the data aggregated from the first location (NJ_001) at the monthly level, you'll need to perform additional data transformations. Consider how you can aggregate the daily data from the second location into a monthly view
notion image

# nj_003
The NJ_003 data, while structurally similar to NJ_001, presents some key distinctions. Firstly, it 
includes additional parameters not present in the NJ_001 dataset. Secondly, the granularity of the 
NJ_003 data differs from NJ_001.
Furthermore, the NJ_003 data encompasses not only ticket sales but also sales of other products within
the theater. Therefore, a crucial step is to filter the data to include only transactions where the
product_type is explicitly defined as a "ticket."
It's important to note that the movie_id is embedded within the details column in the NJ_003 data. 
Additionally, the amount column represents the ticket price only when the corresponding product_type
is designated as a "ticket."
By carefully filtering and extracting the relevant information, we can ensure accurate analysis of 
ticket sales data from the NJ_003 location
notion image
 
⚠️
Note: the same parameters in three locations have different names. Pay attention to that when 
unifying the table. 

#   Requirements for Project Submission
 
To successfully complete the project, we recommend following the plan outlined below:
Create a dedicated database in Snowflake for the project. Upload files to Snowflake and begin 
exploring the data there.

Set up a separate project/account in dbt Cloud specifically for the “Silver Screen” project, and 
connect your Snowflake account to the dbt Cloud project.

Once you have thoroughly studied the data, develop a plan for transforming it. Ideally, draft the 
DAG yourself and ensure that you account for all potential connections between datasets.
💡
Note: There is no single correct solution for how the final project lineage should look. 
The structure will depend on the level of detail you choose to include in your steps.

Define Sources through the .yml file and reference these sources in your models rather than using
hardcoded database paths.

Begin building models step-by-step. As you do, fill in the .yml file with descriptions and tests. 
Aim to document models and columns as extensively as necessary.

Create at least one custom test (singular test).

Ensure that all models execute successfully using dbt run and dbt build, with no errors or failed 
executions. Test the full pipeline thoroughly to confirm smooth operation.

Set up and configure a Cloud Job in dbt Cloud, run it, and verify that it completes successfully
without causing any errors. Validate the results to ensure expected outcomes are achieved.
 
