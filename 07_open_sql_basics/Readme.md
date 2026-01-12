# 07 – Open SQL Basics

This section introduces Open SQL in ABAP, used to read data from SAP tables.

## 🚀 Concepts Covered
- SELECT SINGLE
- SELECT ... INTO wa
- SELECT ... INTO TABLE
- WHERE clause
- ORDER BY
- Aggregate functions (COUNT, SUM, MAX, MIN)
- SY-SUBRC checking

All examples use standard transparent tables like SFLIGHT, SCARR, SPFLI, MARA (depending on availability).

---

## 🧩 Try it yourself

1. Read material number and description from MARA.
2. Read a single airline from SCARR using SELECT SINGLE.
3. Fetch all flights for a carrier into an internal table.
4. Sort flights by price in descending order.
5. Count number of records for a carrier using aggregate.
6. Handle the case when no data is found using SY-SUBRC.

---

## 🎁 Bonus
All solutions are combined in program `z_zbonus_open_sql`.
