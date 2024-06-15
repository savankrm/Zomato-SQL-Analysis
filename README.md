# Zomato Customer Analysis Project

## Introduction

This project is designed to analyze customer purchasing behavior and product popularity on Zomato using SQL queries. By examining sales data, user information, and gold membership details, we aim to uncover valuable insights such as total spending, popular products, and points earned by customers. These insights can help in understanding customer preferences and evaluating the impact of the gold membership program.

## Database Schema

The project uses four main tables:

1. **Users**: Contains user information such as user ID and signup date.
2. **Gold Users Signup**: Contains details about users who have signed up for the gold membership, including user ID and the date they joined the gold program.
3. **Sales**: Contains transaction details, including user ID, the date of purchase, and product ID.
4. **Product**: Contains product details, including product ID, product name, and price.

## Analysis Queries

### 1. Total Amount Spent by Each Customer on Zomato
Calculates the total amount spent by each customer based on their purchases.

### 2. Number of Days Each Customer Visited
Counts the distinct days each customer made purchases, providing insight into customer engagement.

### 3. First Product Purchased by Each Customer
Identifies the first product purchased by each customer, useful for understanding initial customer preferences.

### 4. Most Purchased Item on the Menu
Determines the most purchased item across all customers and the number of times it was purchased, highlighting product popularity.

### 5. Most Popular Item for Each Customer
Finds the most frequently purchased item for each customer, revealing individual preferences.

### 6. First Purchase After Becoming a Gold Member
Identifies the first purchase made by customers after they joined the gold membership program, indicating the impact of membership on purchasing behavior.

### 7. Item Purchased Just Before Becoming a Gold Member
Finds the last item purchased by customers before they joined the gold membership program, providing insight into pre-membership behavior.

### 8. Total Orders and Amount Spent Before Becoming a Gold Member
Calculates the total number of orders and the total amount spent by each customer before they joined the gold membership program, helping to understand the value of customers before they became members.

### 9. Points Collected by Each Customer
Calculates the total points collected by each customer based on their purchases, with different products generating different points.

### 10. Product with the Most Points Given
Identifies the product that has generated the most points for customers, indicating which products drive the most engagement.

### 11. Points Earned in the First Year After Joining the Gold Program
Calculates the points earned by customers in the first year after joining the gold membership program based on a specific points earning rule.

### 12. Ranking Transactions for Gold and Non-Gold Users
Ranks all transactions of customers who have gold membership and marks transactions of non-gold users as 'NA'.

## Concepts Used

### SQL Joins
- **INNER JOIN**: Combines rows from two or more tables based on a related column.
- **LEFT JOIN**: Combines rows from two tables, returning all rows from the left table and the matched rows from the right table.

### Aggregate Functions
- **SUM()**: Calculates the total sum of a numeric column.
- **COUNT()**: Counts the number of rows or distinct values.
- **MIN()**: Finds the minimum value in a column.
- **GROUP BY**: Groups rows that have the same values in specified columns into summary rows.

### Window Functions
- **RANK()**: Assigns a rank to each row within the partition of a result set.

### Conditional Statements
- **CASE WHEN**: Provides if-then-else functionality to SQL queries.

## Learnings

From this project, you will learn:
- How to manipulate and analyze data using SQL queries.
- The use of different types of joins to combine data from multiple tables.
- How to perform aggregate calculations to derive meaningful insights.
- The application of window functions to rank data.
- How to use conditional statements to calculate values based on specific conditions.

## Insights and Actions

### Insights
1. **Customer Spending**: Understand how much each customer spends, identifying high-value customers.
2. **Customer Engagement**: Know how often customers visit and their purchasing patterns to design better loyalty programs.
3. **Product Popularity**: Identify the most popular products to guide inventory and marketing strategies.
4. **Impact of Gold Membership**: Analyze the behavior of gold members to assess the effectiveness of the membership program.

### Actions
- **Targeted Marketing**: Use insights to create targeted marketing campaigns for high-value and frequent customers.
- **Product Promotion**: Promote the most popular products to boost sales.
- **Loyalty Programs**: Enhance loyalty programs based on customer engagement data.
- **Membership Strategies**: Improve gold membership benefits by understanding its impact on customer behavior.

## Conclusion

This project demonstrates how to analyze customer data on Zomato to gain insights into purchasing behavior, product popularity, and the impact of loyalty programs. By leveraging SQL queries, we can derive valuable information that can help in making data-driven decisions to enhance customer experience and business performance.
