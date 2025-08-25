# **Netflix Data Analysis using SQL**

This project focuses on analyzing Netflix’s catalog of movies and TV shows using SQL queries. With Netflix being one of the largest content platforms worldwide, analyzing its dataset provides valuable insights into content distribution, ratings, genres, and trends across countries and years. The project uses SQL for data exploration and answering key business questions about Netflix’s content library.

## Project Overview
### Problem Statement

Netflix has a massive and diverse collection of movies and TV shows. Understanding patterns in this content — such as genre distribution, release trends, content by country, and actor appearances — is important for insights into audience preferences and Netflix’s global strategy. The goal of this project is to use SQL to explore and analyze the Netflix dataset and answer practical business questions.

### Solution

The dataset is stored in a SQL database, and a series of queries are designed to extract insights. These queries cover comparisons between movies and TV shows, genre analysis, rating distribution, top-performing countries, and more. The results can help in understanding Netflix’s content strategy, identifying popular categories, and analyzing trends in different regions.

### Stages of the Project

#### Database Creation

A netflix table is created with columns such as title, type, director, cast, country, release year, rating, duration, listed_in (genre), and description.

#### Exploratory Queries

Count of Movies vs. TV Shows.

Most common content ratings.

Listing movies released in a specific year (e.g., 2020).

Identifying top 5 countries with the most Netflix content.

#### Content Insights

Finding the longest movie.

Identifying content added in the last 5 years.

Listing all shows directed by Rajiv Chilaka.

TV shows with more than 5 seasons.

Count of content in each genre.

#### Country & Actor Analysis

Yearly average content release from India.

Documentaries available on Netflix.

#### Content without a director.

Movies featuring Salman Khan in the last 10 years.

Top 10 actors appearing in Indian content.

#### Content Categorization

Classification of shows/movies into “Good” or “Bad” based on keywords like “kill” or “violence” in their description.

### Technologies and Tools Used

Database: PostgreSQL

Language: SQL

Dataset: Netflix titles dataset (movies + TV shows metadata)

### Key Features

SQL-based exploration of Netflix’s dataset.

Business-focused queries for real-world insights.

Covers content type, ratings, genres, countries, and actors.

Categorization of content into meaningful groups.

Scalable and extendable query set for deeper analysis.

### Conclusion

This project demonstrates how SQL can be used for exploratory data analysis (EDA) of Netflix’s content library. The queries provide valuable insights into content distribution, global reach, actor appearances, and genre popularity, which can help understand viewer preferences and Netflix’s business strategy. The framework can also be adapted to analyze other streaming platforms’ datasets.
