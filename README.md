# SQL_Coding-challenges
# SQL
# Summary
This repository contains a structured collection of MySQL SQL scripts designed for learning and practising core database concepts. Each file is organized by topic and progressively covers fundamental to advanced MySQL features. The scripts are suitable for beginners learning SQL as well as intermediate users who want to reinforce their understanding of relational database concepts.# 📊 E-Learning Platform Purchases – MySQL Project

# 📊 E-Learning Platform Purchases – SQL Analysis

## 📌 Project Overview
This project recreates and analyzes an **e-learning platform database** using MySQL.  
The goal is to explore **sales trends, learner behavior, and course category performance** through SQL queries.

---

## ✅ Steps Completed

### 1. Database Setup & Data Entry
- Created database: `elearning_platform`
- Defined tables:
  - **learners** (learner_id, full_name, country)
  - **courses** (course_id, course_name, category, unit_price)
  - **purchases** (purchase_id, learner_id, course_id, quantity, purchase_date)
- Applied **primary keys** and **foreign keys** for referential integrity.
- Inserted sample data:
  - 7 learners  
  - 4 courses across categories (Basic, Intermediate, Advanced)  
  - 10 purchase records (including some NULL values for testing)

---

### 2. Data Exploration with Joins
- Used **INNER JOIN** to combine learners, courses, and purchases.  
- Displayed: learner name, course name, category, quantity, total amount, purchase date.  
- Applied formatting (currency to 2 decimals, aliases, sorted by highest total amount).  

**Example Output:**
| Learner           | Course        | Category   | Quantity | Total_Amount | Purchase_Date |
|-------------------|--------------|------------|----------|--------------|---------------|
| Archana Sundaram  | Data Analyst | Basic      | 2        | 80000.00     | 2025-01-07    |
| Radha Krishnan    | Data Analyst | Basic      | 1        | 40000.00     | 2025-01-15    |

---

### 3. Analytical Queries
- **Q1:** Total spending per learner with country.  
- **Q2:** Top 3 most purchased courses → *Data Analyst, Advanced Excel, Power BI*.  
- **Q3:** Category revenue & unique learners.  
  - Basic → ₹200,000 (3 learners)  
  - Advanced → ₹170,000 (5 learners)  
- **Q4:** Learners purchasing from multiple categories → *Radha Krishnan*.  
- **Q5:** Courses never purchased → *Software Testing*.

---

### 4. Advanced SQL
- **Subqueries:** Learners spending above average → *Archana Sundaram, Radha Krishnan*.  
- **CTE:** Calculated spending per learner, filtered > 10,000.  
- **CASE Expression:** Classified learners:
  - High Value (>15,000)  
  - Medium Value (8,000–15,000)  
  - Low Value (<8,000)  
- **NULL Handling:** Replaced missing purchase counts with 0.  
- **View:** `category_performance_view` → category, total revenue, number of purchases, average revenue per purchase.

---

## 📈 Key Insights
- **Data Analyst & Advanced Excel** are most popular courses.  
- **Advanced category** generates high revenue.  
- Some courses remain unsold → potential for promotions.  
- **High-value learners** are fewer but contribute most revenue.

---

## ✅ Recommendations
- Focus marketing on **top-performing categories**.  
- Offer **discounts/promotions** on unsold courses.  
- Retain **high-value learners** with loyalty programs.  
