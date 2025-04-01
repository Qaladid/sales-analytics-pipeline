# Data Engineering Project: Sales Performance & Customer Insights

## Project Overview

This Data Engineering project focuses on building a comprehensive **Sales Analytics Pipeline** that extracts, transforms, and loads (ETL) data from SQL Server into Snowflake, then applies transformations using **DBT** to create insights into **Sales Performance** and **Customer Purchase Patterns**.

The goal of this pipeline is to understand customer behavior, sales performance, and product demand trends. By analyzing key metrics, businesses can make more informed decisions about marketing, sales strategies, inventory planning, and customer retention.

### Key Business Questions Addressed by the Project
- **Customer Insights**: Who are the top customers by revenue? What regions/states have the most customers?
- **Sales Performance**: What products generate the most sales? What is the revenue trend over time?
- **Product Demand**: Which products have the highest return rates? How do discounts impact sales?

## Project Architecture

### 1. Data Ingestion
The project uses **DLT (Data Load Tool)** to move raw sales data from **SQL Server** to **Snowflake** (staging schema). This step ensures that the data is clean, resilient, and ready for transformation.

### 2. Data Transformation
Once the data is in Snowflake, **DBT (Data Build Tool)** is used to transform it into analytical tables that support various business use cases. The data is structured into two main schemas:
- **Staging Schema**: Contains raw, untransformed data (e.g., customer details, sales transactions).
- **Analytics Schema**: Contains business-ready data that is aggregated and transformed for analysis (e.g., sales performance, customer insights).

### 3. Data Orchestration
**Kestra** is used to automate and schedule the workflows, ensuring that the ETL pipeline runs at regular intervals (e.g., daily or weekly).

### 4. Data Visualization
The project integrates with **Power BI** (or any other BI tool like Tableau) to create dashboards that visualize key metrics and trends for business stakeholders.

---

## Data Model

### Staging Models (Raw Data Cleaned & Standardized)

The staging models clean and standardize the raw tables, preparing them for further analysis:
- **stg_customers**: Cleans customer data.
- **stg_sales_orders**: Cleans sales order headers.
- **stg_sales_order_details**: Cleans sales order line items.
- **stg_products**: Cleans product data, including categories and subcategories.
  
These tables allow for efficient querying and aggregations in the downstream analytics models.

### Analytics Models (Business-Ready Data for Reporting)

The analytics models are designed to calculate key metrics and generate insights:
- **sales_performance**: Calculates total revenue, number of orders, and top-selling products.
- **customer_analysis**: Analyzes top customers, customer lifetime value, and purchase behavior.
- **product_demand**: Identifies the most returned items and top-selling categories.
- **discount_impact**: Analyzes how discounts and promotions affect sales.

### Fact Table: **fact_sales**

The **fact_sales** table aggregates transactional data and includes key metrics such as:
- **Total Quantity Sold**: Total quantity of each product sold.
- **Total Sales Amount**: Total revenue generated for each product.
- **Subtotal, Tax, Freight, Total Due**: Financial metrics associated with individual orders.

This table serves as the foundation for understanding the sales performance and customer purchase patterns.

---

## Key Business Impact: Analyzing Customer Purchase Patterns

Analyzing **Customer Purchase Patterns** provides critical insights into customer behavior, which helps businesses optimize their strategies for marketing, sales, inventory management, and customer retention. Here's how:

### 1. **Personalized Marketing & Recommendations**
   - Identify frequent buyers and their preferences.
   - Suggest relevant products or promotions based on past purchases.
   - Boost sales through personalized marketing strategies.

### 2. **Optimizing Pricing & Special Offers**
   - Analyze how discounts and special offers impact customer spending.
   - Adjust promotions to maximize revenue and profitability by targeting specific customer segments.

### 3. **Customer Segmentation & Retention**
   - Segment customers based on buying behavior (e.g., high-value vs. occasional buyers).
   - Implement targeted retention strategies, such as loyalty programs or exclusive deals, to increase customer loyalty and lifetime value.

### 4. **Sales Forecasting & Inventory Planning**
   - Predict future demand based on purchase trends and historical data.
   - Optimize inventory levels to reduce overstock and minimize stockouts, ensuring a smooth supply chain.

### 5. **Customer Lifetime Value (CLV) Analysis**
   - Identify high-value customers who contribute the most to long-term revenue.
   - Focus marketing efforts on retaining profitable customers and nurturing their loyalty.

---

## Project Setup

### 1. **Clone the Repository**

Start by cloning the repository:

```bash
git clone https://github.com/Qaladid/sales-analytics-pipeline.git
cd sales-analytics-pipeline
