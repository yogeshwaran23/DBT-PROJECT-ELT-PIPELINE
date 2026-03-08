# DBT-PROJECT-ELT-PIPELINE

<img width="1024" height="559" alt="image" src="https://github.com/user-attachments/assets/c7643a1a-d9ce-4362-b6de-50f0c62b4b32" />

## 📊 Dataset Structure
The following tables were created with synthetic data and loaded into **Snowflake**:

* **CUSTOMER**: 200 records
* **ORDERS**: 200 records
* **PRODUCT**: 200 records
* **ORDER_ITEMS**: 400 records (Includes 200 intentional duplicates for testing)

---

## 🏗️ dbt Project Structure

### 1. Staging Models
Located in the `models/` directory, these handle:
* **Renaming columns** for better readability.
* **Standardizing strings** (casing/trimming).
* **Deduplication** (Removing the 200 extra records in `ORDER_ITEMS`).
* **Null Handling** for data integrity.

**Key Files:**
* `customer_staging.sql`
* `orders_staging.sql`
* `order_items_stag.sql`
* `products_staging.sql`

### 2. Custom Macros
Reusable logic used across the project:
* **`string_stand_macro.sql`**: Standardizes text formats and trims spaces.
* **`handle_nulls_macros.sql`**: Replaces missing values with appropriate defaults.

---

## 🧪 Data Quality & Testing
We use `staging.yml` to define and run tests automatically. This ensures our pipeline remains reliable.

**Tests include:**
* `unique`: Ensures IDs are not duplicated.
* `not_null`: Ensures critical columns are never empty.



<img width="1904" height="821" alt="image" src="https://github.com/user-attachments/assets/f1060cd6-e783-48f2-a4ba-ee5c194181ca" />

