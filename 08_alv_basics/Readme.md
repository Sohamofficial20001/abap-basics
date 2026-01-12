# 08 – ALV Basics in ABAP

## 🎯 What you will learn
This section teaches how to display data in an **ABAP List Viewer (ALV)** grid using the modern object-oriented class `CL_SALV_TABLE`.  
ALV grids are widely used in SAP to show tabular results with sorting, filtering, export and toolbar functions. :contentReference[oaicite:0]{index=0}

In this topic you will cover:
- Selecting data into an internal table
- Creating an ALV grid using `CL_SALV_TABLE`
- Basic display settings
- Column optimization and toolbar functions
- Simple validation and error handling

## 🧩 Keywords
ALV, CL_SALV_TABLE, factory, display, internal table, ORDER BY, optimization

## 🛠 Transactions Used
- SE38 / SE80 – create & run ABAP report
- SE16H / SE11 – view table contents (optional)

## 📄 Programs Included
- **z_08_alv_basic_demo.abap** – basic ALV report using SFLIGHT table

## ✍️ Explanation (Short & Simple)
`CL_SALV_TABLE` is the modern object-oriented class used to create ALV grids in ABAP. It simplifies the creation of an ALV list without explicitly building a field catalog.  
This example selects flight data into an internal table and displays it in an ALV grid, with toolbar functions and column width optimization.

## 🧭 Try it yourself
1. Modify the report to select only flights with a price > 300.  
2. Change the ALV title to include the carrier name.  
3. Try removing `set_all( abap_true )` and observe the available toolbar functions.  
4. Add a WHERE condition on connection ID (`connid`).  

## 🔍 Notes
- Always check for **no data found** before creating the ALV.  
- Use `TRY…CATCH` to handle any SALV exceptions when creating the ALV object.  
