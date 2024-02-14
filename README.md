# SQL Painting Data Analysis 

This project performs analysis of painting data stored in a PostgreSQL database. The data is loaded from multiple CSV files using Python.

## Data 

The key data files loaded into the database include:

- artists.csv - Contains columns for artist id, name, nationality, birth info, style etc.
- works.csv - Painting details including id, title, artist id, style, museum id.
- museums.csv - Museum name, address, city, country, contact info.
- subjects.csv - Subjects depicted in each painting.
- Other supporting tables like museum hours, canvas size etc.

## Analysis

Key analyses performed on the painting data include:

**Museum Analysis**

- Identifying paintings not displayed in any museum 
- Finding museums without any paintings 
- Analyzing museums open 7 days a week 
- Determining most and least popular museums 
- Identifying museums with invalid city data 
- Checking for incorrect museum hours data 

**Artist Analysis** 

- Determining most and least popular artists
- Finding artists with paintings across multiple countries 
- Identifying artists with most expensive and least expensive paintings 
- Analyzing artists with most portraits abroad 

**Painting Analysis**

- Comparing asking vs regular painting prices 
- Determining most and least popular painting subjects 
- Analyzing paintings by style over time and geography 
- Identifying countries with most paintings 

**Other Analysis** 

- Evaluating canvas size costs
- Cleaning duplicate records 
- Finding top cities for museums 

All the analyses performed are stored as 'insight.sql' files.

## Importing Data from csv files to postgreSQL Database

- data_import.py - Imports the CSV files into SQL database 

## Usage

To use this project:

- Import the CSV files into PostgreSQL
- Run the .sql files to execute the analysis queries
- Modify queries and customize analyses as needed

This project is licensed under the MIT License, allowing for the free use, modification, and distribution of the code. See the LICENSE file for more details.
