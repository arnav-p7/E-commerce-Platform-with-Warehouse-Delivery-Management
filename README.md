# 🛒 E-Commerce Platform with Warehouse & Delivery Management

A production-grade relational database system modelling a full-scale
e-commerce supply chain — from vendor onboarding and multi-warehouse
inventory to order fulfillment, last-mile delivery, and business analytics.

Built as part of the **Database Management Systems** course at
**Dhirubhai Ambani University of Technology (DA-IICT)**.

---

## 📐 Database Design

- **20 relational tables** spanning the complete e-commerce supply chain
- Fully normalized to **BCNF** — minimal functional dependencies derived
  and verified for all 20 relations
- Schema designed using an **ER diagram (DIA)** before implementation
- Enforces **referential integrity** via primary keys, foreign keys,
  composite keys, candidate keys, and self-referential relationships
- PostgreSQL constraints used throughout: `NOT NULL`, `UNIQUE`, `CHECK`,
  `ON DELETE CASCADE / RESTRICT / SET NULL`

---

## 🗂️ Schema Overview

|      Module        |                    Tables                     |
|--------------------|-----------------------------------------------|
| Users & Auth       | `User`, `Customer`, `Admin`                   |
| Vendors & Products | `Vendor`, `Product`, `Category`               |
| Warehousing        | `Warehouse`, `Warehouse_Manager`, `Inventory` |
| Orders             | `Orders`, `Order_Item`                        |
| Payments           | `Payment`                                     |
| Delivery           | `Delivery`, `Delivery_Agent`                  |
| Post-Order         | `Return_Request`, `Refund`, `Review`          |
| Marketing          | `Coupon`, `Campaign`                          |

---

## 📊 Analytical Queries

The schema supports complex business intelligence queries including:

- 🏆 Top-selling products by month and category
- 🏭 Warehouse fulfillment efficiency and order throughput
- 💰 Vendor revenue and performance ranking
- 🔄 Product return rate analysis by category
- 👤 High-value and most-frequent customer identification
- 📣 Promotional campaign effectiveness tracking

---


## 🛠️ Tech Stack

- **Database**: PostgreSQL
- **Schema Design**: ER Diagram (DIA) → Relational Schema → BCNF Proof
- **DDL**: Full `CREATE TABLE` scripts with constraints and dependency ordering
- **Querying**: Multi-table JOINs, subqueries, aggregations,
  `GROUP BY`, `HAVING`, correlated queries
