# Retail Sales Exploratory Data Analysis (EDA)

This project applies **Exploratory Data Analysis (EDA)** on a retail sales dataset to uncover insights into customer behavior, product performance, and seasonal trends. The analysis helps identify patterns, discover potential marketing strategies, and improve inventory management for retail businesses.

---

## 📊 Project Overview

In this project, we analyze a dataset that includes **1,000 retail transactions**, containing information about customer demographics, product categories, quantities, prices, and total sales amounts. The goal is to explore the data, generate useful insights, and provide actionable business recommendations for optimizing sales, customer loyalty, and inventory management.

### **Key Objectives:**
- **Understand customer behavior** based on age, gender, and spending habits.
- **Identify seasonal trends** and product categories that drive revenue.
- **Recommend actionable strategies** for improving customer loyalty, product bundling, and pricing.
- **Provide visualizations** to effectively communicate insights and trends.

---

## 🔄 Workflow

1. **Data Loading & Cleaning**: The dataset is loaded and cleaned using **pandas**, ensuring no missing values and proper data types.
2. **Exploratory Data Analysis (EDA)**: Data is analyzed to discover trends in customer spending, product categories, and seasonal patterns.
3. **Visualization**: Insights are communicated through visualizations using **matplotlib** and **seaborn**.
4. **Recommendations**: Actionable business recommendations are derived based on the data analysis.

---

## 🛠️ Tech Stack

- **Python**: The main programming language used.
- **pandas**: For data manipulation and analysis.
- **matplotlib & seaborn**: For data visualization and charting.
- **Jupyter Notebook**: For creating and documenting the analysis.
- **SQL** : For querying and transforming the dataset.

---

## 📋 Data Description

The dataset contains the following columns:

- **Transaction ID**: Unique identifier for each transaction.
- **Date**: Date when the transaction occurred.
- **Customer ID**: Unique identifier for each customer.
- **Gender**: Customer’s gender.
- **Age**: Customer’s age.
- **Product Category**: Category of the purchased product (e.g., Beauty, Clothing, Electronics).
- **Quantity**: Quantity of the product purchased.
- **Price per Unit**: Price of one unit of the product.
- **Total Amount**: Total value of the transaction (Quantity * Price per Unit).

---

## 🧩 Key Findings

### **1. Customer Demographics**
- **Top Spending Age Group**: Younger customers, particularly in the **16–34** age range, contribute the highest revenue. This group also shows the highest average transaction value.
- **Gender Distribution**: There is a noticeable difference in spending across genders. **Females** tend to spend more on **Beauty** and **Clothing**, while **Males** spend more on **Electronics**.

### **2. Product Performance**
- **Top Revenue Generating Categories**: The **Electronics** category leads in terms of total revenue, followed closely by **Clothing**. However, **Beauty** products have higher margins but lower overall sales volume.
- **Product Bundling Opportunity**: **Clothing** items, while selling frequently, generate lower revenue compared to **Electronics**. Bundling **Clothing** with higher-margin **Beauty** items (e.g., skincare kits) in March and September can boost overall transaction value.

### **3. Seasonal Trends**
- **Peak Sales Months**: **February**, **May**, and **December** are the months with the highest revenue, particularly for **Electronics**. February has the highest sales volume per transaction.
- **December Focus**: December sees a shift in purchasing behavior towards **gift bundles** like **Beauty** and **Clothing** rather than high-ticket **Electronics**.
  
### **4. Pricing Insights**
- **High-Ticket Electronics**: February is the best month for promoting **high-ticket Electronics** due to the high volume of transactions. Offering bundling and tiered pricing can increase sales during this time.
- **Low-Priced Entry Points**: Offering low-priced items (under $50) as entry points helps drive traffic, after which upselling through bundles or loyalty programs can increase revenue.

---

## 📈 Visualizations

In this project, multiple types of visualizations were used to communicate the findings:

- **Histograms**: To show the distribution of numeric data (e.g., total transaction amounts).
- **Bar Charts**: To compare the frequency of product categories and customer demographics.
- **Line Plots**: To visualize seasonal trends in revenue and transactions.
- **Pie Charts**: To represent the share of revenue from different product categories.

