# Smart Supply Chain & Inventory Intelligence Platform

An end-to-end **data analytics and business intelligence project** for monitoring supply-chain performance across **sales, inventory, products, suppliers, warehouses, customers, purchasing, and delivery performance**.

The project demonstrates a complete analytics workflow using **Excel → Python → MySQL → Power BI**, transforming multi-table operational data into management-oriented KPIs, inventory indicators, supplier insights, sales analysis, and supply-chain risk measures.

---

## 📌 Project Overview

Large supply-chain operations face multiple challenges:

- Products frequently going out of stock
- Excess or inefficient inventory
- Supplier delivery delays
- Long supplier lead times
- Increasing purchasing and operating costs
- Demand differences across regions and customer segments
- Warehouse capacity and operating-cost differences
- Products generating high sales but having relatively low margins
- Difficulty identifying products that require replenishment attention
- Limited visibility into end-to-end supply-chain risk

This project builds an analytical framework to answer questions such as:

- Which products and categories generate the highest revenue?
- Which products experience stockout conditions?
- Which products have high demand but relatively low inventory?
- Which suppliers have long lead times and lower reliability?
- Which suppliers have high delivery delays?
- Which warehouses combine low capacity with high operating cost?
- Which customer segments generate the most revenue?
- Which products have high sales but lower profit margins?
- What is the monthly sales and revenue trend?
- Which products have higher supply-chain risk based on demand, inventory, and supplier lead time?

---

## 🎯 Business Objectives

1. Monitor **sales and revenue performance**
2. Analyze **product profitability and margins**
3. Track **inventory levels and stockout conditions**
4. Measure **inventory turnover**
5. Evaluate **supplier reliability and lead times**
6. Analyze **purchase delivery performance**
7. Compare **warehouse capacity and operating costs**
8. Understand **customer segment performance**
9. Identify **high-demand / low-inventory products**
10. Develop a **supply-chain risk indicator**
11. Create a management-oriented **Power BI dashboard**
12. Build a reusable analytical pipeline from raw data to business insights

---

## 🏗️ Project Architecture

```text
Raw Data
   │
   ▼
Excel Inspection & Initial Cleaning
   │
   ▼
Python / Pandas
   ├── Data Cleaning
   ├── Data Validation
   ├── Feature Engineering
   └── Exploratory Data Analysis
   │
   ▼
Cleaned & Processed CSVs
   │
   ▼
MySQL
   ├── Relational Analysis
   ├── Joins
   └── Business Queries
   │
   ▼
Power BI
   ├── Sales & Revenue Analysis
   ├── Product Analysis
   ├── Inventory Analysis
   ├── Supplier Analysis
   ├── Warehouse Analysis
   └── Supply-Chain Risk Analysis
```

---

## 🛠️ Tech Stack

| Technology                     | Purpose                                                   |
| ------------------------------ | --------------------------------------------------------- |
| **Microsoft Excel**      | Initial inspection, auditing and spreadsheet-based review |
| **Python**               | Data cleaning, validation, feature engineering and EDA    |
| **Pandas / NumPy**       | Data transformation and analytical calculations           |
| **Matplotlib / Seaborn** | Exploratory visual analysis                               |
| **MySQL**                | Relational analysis, joins and business queries           |
| **Power BI**             | Interactive dashboard and management reporting            |
| **Jupyter Notebook**     | Reproducible data-cleaning and analysis workflow          |

---

# 📂 Dataset

The project contains **seven related datasets**.

| Dataset              | Records | Purpose                                             |
| -------------------- | ------: | --------------------------------------------------- |
| **Products**   |   1,000 | Product, category, pricing and supplier information |
| **Suppliers**  |     100 | Supplier reliability and lead-time information      |
| **Warehouses** |      20 | Warehouse capacity and operating-cost information   |
| **Inventory**  | 365,010 | Daily inventory movement and stock position         |
| **Orders**     | 500,013 | Customer orders, quantity, discount and revenue     |
| **Customers**  |  10,000 | Customer segment, region and acquisition channel    |
| **Purchases**  |  75,003 | Supplier purchases and delivery performance         |

### Core Product Fields

- `Product_ID`
- `Product_Name`
- `Category`
- `Sub_Category`
- `Unit_Cost`
- `Selling_Price`
- `Supplier_ID`

### Supplier Fields

- `Supplier_ID`
- `Supplier_Name`
- `Region`
- `Lead_Time_Days`
- `Reliability_Score`

### Warehouse Fields

- `Warehouse_ID`
- `Warehouse_Name`
- `Region`
- `Capacity`
- `Operating_Cost`

### Inventory Fields

- `Inventory_ID`
- `Product_ID`
- `Warehouse_ID`
- `Date`
- `Opening_Stock`
- `Received_Qty`
- `Sold_Qty`
- `Closing_Stock`
- `Damaged_Qty`

### Order Fields

- `Order_ID`
- `Order_Date`
- `Product_ID`
- `Warehouse_ID`
- `Customer_ID`
- `Quantity`
- `Revenue`
- `Discount`
- `Order_Status`

### Customer Fields

- `Customer_ID`
- `Customer_Segment`
- `Region`
- `Acquisition_Channel`

### Purchase Fields

- `Purchase_ID`
- `Supplier_ID`
- `Product_ID`
- `Warehouse_ID`
- `Purchase_Date`
- `Quantity`
- `Unit_Cost`
- `Expected_Date`
- `Actual_Date`

---

# 🔄 Data Preparation

## 1. Excel

Microsoft Excel was used as a preliminary visual inspection and auditing tool before programmatic processing.

Initial inspection included:

- Schema and column-header review
- Data-type inspection
- Sorting and filtering
- Identification of visible null values
- Identification of inconsistent formatting
- Detection of trailing whitespaces
- Review of value ranges and obvious outliers
- Initial assessment of downstream transformation requirements

---

## 2. Python Data Cleaning

The Python cleaning notebooks perform table-level transformations such as:

- Duplicate removal using business keys
- String trimming
- Case standardization
- Consistent null-value handling
- Date parsing
- Missing-value handling
- Relationship-based enrichment
- Correction of negative numeric values where required
- Cross-table mapping using related IDs
- Clean CSV generation

### Product Cleaning

Product processing includes:

- Standardizing text fields
- Removing duplicate `Product_ID` records
- Mapping missing categories from sub-categories
- Mapping missing sub-categories from categories
- Filling missing unit costs using purchase information
- Correcting invalid or negative selling prices
- Filling missing supplier IDs using purchase relationships

### Supplier Cleaning

Supplier processing includes:

- Text standardization
- Whitespace removal
- Null-value normalization
- Duplicate removal using `Supplier_ID`

### Warehouse Cleaning

Warehouse processing includes:

- Text standardization
- Whitespace removal
- Null-value normalization
- Duplicate removal using `Warehouse_ID`

### Inventory Cleaning

Inventory processing includes:

- Standardizing inventory and relationship IDs
- Duplicate removal using `Inventory_ID`
- Filling missing product and warehouse relationships using purchase/inventory relationships
- Correcting negative stock quantities
- Reconstructing missing inventory quantities using stock-flow relationships
- Date conversion

### Order Cleaning

Order processing includes:

- Standardizing order and relationship IDs
- Duplicate removal using `Order_ID`
- Correcting invalid product identifiers
- Filling missing product/warehouse relationships
- Estimating missing quantities using revenue, cost and discount relationships
- Calculating missing discount values where possible
- Reconstructing missing revenue values

### Customer Cleaning

Customer processing includes:

- Text standardization
- Whitespace removal
- Null-value normalization
- Duplicate removal using `Customer_ID`

### Purchase Cleaning

Purchase processing includes:

- Standardizing purchase and relationship IDs
- Duplicate removal using `Purchase_ID`
- Filling missing supplier/product relationships
- Filling missing warehouse relationships using inventory relationships

---

# 📊 Key KPIs

The analytical workflow focuses on the following KPI groups.

## Sales & Revenue

- Total revenue
- Total orders
- Total units sold
- Average order revenue
- Monthly revenue
- Monthly order volume
- Monthly units sold
- Top products by revenue
- Revenue by category

## Product Performance

- Product count
- Product category
- Product sub-category
- Unit cost
- Selling price
- Product profit
- Profit margin
- High-profit products
- High-margin products
- High-sales / low-margin products

## Inventory

- Total inventory records
- Opening stock
- Received quantity
- Sold quantity
- Closing stock
- Damaged quantity
- Stockout records
- In-stock records
- COGS
- Average inventory value
- Inventory turnover

## Supplier

- Supplier count
- Reliability score
- Reliability category
- Lead time
- Lead-time category
- Average lead time
- Supplier region
- Delivery performance
- Average delivery days
- Late deliveries

## Warehouse

- Warehouse count
- Capacity
- Capacity category
- Operating cost
- Operating-cost category
- Regional warehouse distribution
- Low-capacity / high-cost warehouses

## Customer

- Customer count
- Customer segment
- Customer region
- Acquisition channel
- Revenue by customer segment
- Average revenue by customer segment

## Supply-Chain Risk

- High-demand products
- Low-inventory products
- Supplier lead-time exposure
- Product-level supply-chain risk score
- Supplier reliability exposure
- Stockout exposure

---

# 🔎 Key Findings from the Current Processed Dataset

The following figures are calculated from the processed CSVs included in this project.

## Portfolio Overview

- **1,000 products**
- **100 suppliers**
- **20 warehouses**
- **10,000 customers**
- **365,010 inventory records**
- **500,013 orders**
- **75,003 purchase records**
- **10 product categories**
- **36 product sub-categories**

---

## Sales Performance

- Total recorded revenue: **₹74.44 Cr**
- Total orders: **500,013**
- Total units sold: **2,007,206**
- Average order revenue: approximately **₹1,488.89**

The largest product-category revenue contribution in the processed order data is:

- **Fashion:** approximately ₹9.39 Cr
- **Electronics:** approximately ₹8.87 Cr
- **Grocery:** approximately ₹8.19 Cr
- **FMCG:** approximately ₹7.88 Cr

---

## Inventory Exposure

- **365,010 inventory records**
- **342,421** records are classified as In Stock
- **22,589** records are classified as Stockout
- Stockout records represent approximately **6.19%** of inventory records

The project therefore provides a basis for monitoring product availability and identifying inventory conditions that may require replenishment attention.

---

## Supplier & Delivery Exposure

- **100 suppliers**
- Average supplier reliability score: approximately **57.69**
- Average supplier lead time: approximately **16.34 days**
- **75,003 purchase records**
- **40,180 purchases** are classified as Late Delivery
- Late deliveries represent approximately **53.57%** of purchase records
- Average purchase delivery time: approximately **18.81 days**
- Maximum recorded delivery time: **42 days**

Supplier reliability distribution:

- **40 Low reliability**
- **33 Medium reliability**
- **27 High reliability**

Lead-time distribution:

- **22 Fast**
- **22 Medium**
- **23 Slow**
- **33 Poor**

---

## Warehouse Exposure

There are **20 warehouses** in the processed dataset.

Capacity classification:

- **9 High-capacity warehouses**
- **7 Medium-capacity warehouses**
- **4 Low-capacity warehouses**

Operating-cost classification:

- **11 High-cost warehouses**
- **5 Medium-cost warehouses**
- **4 Low-cost warehouses**

Two warehouses satisfy the project's specific analytical condition of **Low Capacity + High Operating Cost**:

- `W113`
- `W118`

---

## Customer Portfolio

The processed customer dataset contains **10,000 customers**.

Customer segment distribution:

- **Mass:** 4,545
- **Regular:** 3,369
- **Premium:** 1,496
- **Wholesale:** 483

Customer analysis is used to compare revenue contribution and average order revenue across segments.

---

## Product Economics

The processed product data contains:

- **1,000 products**
- Average product margin: approximately **39.32%**
- Product-level profit and margin calculations
- Product-level category and sub-category information

The highest-revenue product in the current processed order data is:

- `P1035` — approximately **₹60.15 Lakh** in recorded revenue

Other high-revenue products include `P1938`, `P1325`, `P1049`, and `P1865`.

---

# 🧠 Analytical Questions Addressed

The MySQL analysis includes queries for:

### 1. Overall Sales Performance

Calculates:

- Total revenue
- Total orders
- Total units sold

### 2. Top Products by Revenue

Ranks products based on total recorded revenue.

### 3. Category Revenue and Profit

Compares product categories using revenue and product-level profit information.

### 4. Monthly Sales Trend

Analyzes:

- Monthly revenue
- Monthly orders
- Monthly units sold

### 5. Stockout Conditions

Identifies inventory records where the processed stock status indicates a stockout.

### 6. High Demand + Low Inventory

Combines product demand with aggregated inventory to identify products with high order activity and relatively low closing stock.

### 7. Supplier Lead-Time Exposure

Identifies suppliers with longer lead times and their reliability scores.

### 8. Supplier Delivery Performance

Calculates supplier-level on-time/early delivery percentages.

### 9. Supplier Delivery Delays

Calculates average delivery days by supplier.

### 10. High Sales + Low Margin

Combines product order activity with product margin information to identify products requiring margin analysis.

### 11. Customer Segment Revenue

Compares revenue and average revenue across customer segments.

### 12. Supply-Chain Risk

Combines:

- Product demand
- Product inventory
- Supplier lead time

to calculate the project-defined **Supply-Chain Risk Score**.

---

# 📈 Power BI Dashboard

The Power BI solution is designed to provide management-oriented visibility into the supply chain.

The dashboard analysis can cover:

1. **Sales & Revenue Performance**
2. **Product Performance**
3. **Inventory Analysis**
4. **Supplier Analysis**
5. **Warehouse Analysis**
6. **Customer Analysis**
7. **Supply-Chain Risk**

Interactive analysis can be performed using dimensions such as:

- Product
- Category
- Sub-category
- Supplier
- Warehouse
- Region
- Customer segment
- Order status
- Delivery status
- Month

---

# 📁 Repository Structure

```text
Smart Supply Chain & Inventory Intelligence Platform/
│
├── Data/
│   │
│   ├── Raw/
│   │   ├── Raw_Products.csv
│   │   ├── Raw_Suppliers.csv
│   │   ├── Raw_Warehouses.csv
│   │   ├── Raw_Inventory.csv
│   │   ├── Raw_Orders.csv
│   │   ├── Raw_Customers.csv
│   │   └── Raw_Purchases.csv
│   │
│   ├── Cleaned/
│   │   ├── Products.csv
│   │   ├── Suppliers.csv
│   │   ├── Warehouses.csv
│   │   ├── Inventory.csv
│   │   ├── Orders.csv
│   │   ├── Customers.csv
│   │   └── Purchases.csv
│   │
│   └── Processed/
│       ├── Products.csv
│       ├── Suppliers.csv
│       ├── Warehouses.csv
│       ├── Inventory.csv
│       ├── Orders.csv
│       ├── Customers.csv
│       └── Purchases.csv
│
├── Excel/
│   ├── 1_Products.xlsx
│   ├── 2_Suppliers.xlsx
│   ├── 3_Warehouses.xlsx
│   ├── 4_Inventory.xlsx
│   ├── 5_Orders.xlsx
│   ├── 6_Customers.xlsx
│   └── 7_Purchases.xlsx
│
├── Python/
│   │
│   ├── Data_Cleaning/
│   │   ├── 1_Products.ipynb
│   │   ├── 2_Suppliers.ipynb
│   │   ├── 3_Warehouses.ipynb
│   │   ├── 4_Inventory.ipynb
│   │   ├── 5_Orders.ipynb
│   │   ├── 6_Customers.ipynb
│   │   └── 7_Purchases.ipynb
│   │
│   └── Data Analysis/
│       ├── 1_Products.ipynb
│       ├── 2_Suppliers.ipynb
│       ├── 3_Warehouses.ipynb
│       ├── 4_Inventory.ipynb
│       ├── 5_Orders.ipynb
│       ├── 6_Customers.ipynb
│       └── 7_Purchases.ipynb
│
├── MySQL/
│   └── Query.sql
│
├── PowerBI/
│   └── Dashboard.pbix
│
├── Screenshots/
│
└── README.md
```

---

# 🧪 Data Quality & Assumptions

The project contains a data-cleaning workflow, but the dataset is intended for analytics demonstration and should be reviewed before production use.

### Observed Data Preparation Issues

The cleaning notebooks address issues including:

- Duplicate records
- Missing values
- Inconsistent capitalization
- Trailing whitespaces
- Non-standard null representations
- Invalid product identifiers
- Missing product/supplier/warehouse relationships
- Negative inventory quantities
- Missing quantity, discount and revenue fields
- Missing product pricing information
- Inconsistent date formats

### Important Analytical Assumptions

The cleaning workflow uses relationship-based and rule-based transformations where required.

Examples include:

- Missing product costs can be mapped from purchase records.
- Missing supplier IDs can be mapped through product/purchase relationships.
- Missing inventory quantities can be reconstructed using stock-flow relationships.
- Missing order quantity can be estimated from revenue, unit cost and discount.
- Missing order revenue can be reconstructed from quantity, cost and discount.
- Supplier delivery status is determined by comparing actual and expected delivery dates.
- Inventory status is based on closing stock.
- Supply-chain risk is calculated using the project-defined demand/inventory/lead-time formula.

These assumptions are appropriate for demonstrating an analytics pipeline, but should be **reviewed with domain stakeholders before using the model for real inventory, purchasing, or financial decisions**.

---

# 🚀 How to Reproduce the Analysis

## Step 1 — Inspect the Data

Open the Excel workbooks in:

```text
Excel/
```

Review the seven source tables and understand the relationships between products, suppliers, warehouses, inventory, orders, customers and purchases.

---

## Step 2 — Run Python Cleaning

Run the notebooks in:

```text
Python/Data_Cleaning/
```

The cleaned datasets are written to:

```text
Data/Cleaned/
```

---

## Step 3 — Run Python Analysis

Run the notebooks in:

```text
Python/Data Analysis/
```

The feature-engineered datasets are written to:

```text
Data/Processed/
```

---

## Step 4 — Run MySQL Analysis

Create/import the supply-chain tables in MySQL and execute:

```text
MySQL/Query.sql
```

The SQL file contains business-oriented queries covering:

- Sales
- Products
- Inventory
- Suppliers
- Purchases
- Customers
- Supply-chain risk

---

## Step 5 — Open Power BI

Open:

```text
PowerBI/Dashboard.pbix
```

Refresh the data connections if required.

---

# 💼 Business Value

This project demonstrates how raw supply-chain data can be transformed into a **decision-support system**.

The analytical workflow helps management:

- Monitor revenue and sales performance
- Identify stockout conditions
- Understand product demand
- Analyze inventory turnover
- Evaluate supplier reliability
- Identify delivery delays
- Compare warehouse capacity and operating costs
- Analyze customer segments
- Identify high-sales / low-margin products
- Detect products with higher supply-chain exposure
- Move from descriptive reporting toward **risk-based supply-chain monitoring**

---

# 🔮 Future Improvements

Potential next steps include:

- Build a formal **Inventory Health Score**
- Add **Economic Order Quantity (EOQ)** calculations
- Add **Reorder Point (ROP)** calculations
- Incorporate safety-stock requirements
- Add demand forecasting
- Add supplier performance scorecards
- Add warehouse utilization metrics
- Add inventory aging and dead-stock analysis
- Add ABC inventory classification
- Add service-level and fill-rate KPIs
- Add purchase-order aging analysis
- Add automated data-quality checks
- Add time-series inventory monitoring
- Build predictive models for **stockout risk**
- Build predictive models for **supplier delivery delays**
- Build predictive models for **demand forecasting**
- Add Power BI drill-through pages for individual products and suppliers
- Automate the ETL pipeline instead of manually running notebooks
- Add automated reorder recommendations based on demand and lead time

---

# 👨‍💻 Skills Demonstrated

**Data Analytics | Data Cleaning | Exploratory Data Analysis | Python | Pandas | NumPy | SQL | MySQL | Excel | Power BI | Data Visualization | KPI Development | Inventory Analytics | Supply-Chain Analytics | Supplier Analytics | Sales Analytics | Business Intelligence**
