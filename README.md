# DBT-PROJECT-ELT-PIPELINE


  🏗 High Level Architecture

Raw Data Sources
      ↓
Snowflake Raw Layer
      ↓
dbt Staging Layer
      ↓
dbt Intermediate Layer
      ↓
dbt Mart Layer (Star Schema)
      ↓
Analytics / BI Dashboard




Project Folder Structure


ecommerce_analytics_project
│
├── models
│   ├── staging
│   │      stg_customers.sql
│   │      stg_orders.sql
│   │      stg_products.sql
│   │      stg_order_items.sql
│   │
│   ├── intermediate
│   │      int_order_details.sql
│   │      int_customer_orders.sql
│   │
│   └── marts
│          fact_sales.sql
│          dim_customers.sql
│          dim_products.sql
│
├── macros
│      calculate_revenue.sql
│      surrogate_key.sql
│      null_handler.sql
│
├── tests
│
├── snapshots
│      customer_snapshot.sql
│
└── seeds
       sample_data.csv





