# Power BI Measures

Create these measures after loading `online_retail`.

```DAX
Total Revenue = SUM(online_retail[Revenue])

Total Orders = DISTINCTCOUNT(online_retail[InvoiceNo])

Unique Customers = DISTINCTCOUNT(online_retail[CustomerID])

Units Sold = SUM(online_retail[Quantity])

Average Order Value = DIVIDE([Total Revenue], [Total Orders])

Average Revenue per Customer =
DIVIDE([Total Revenue], [Unique Customers])
```

## Recommended visuals

### Executive Overview
- Card: Total Revenue
- Card: Total Orders
- Card: Unique Customers
- Card: Units Sold
- Line chart: YearMonth vs Total Revenue
- Bar chart: Country vs Total Revenue

### Product Analysis
- Bar chart: Top products by Total Revenue
- Bar chart: Top products by Units Sold
- Table: Product, Units Sold, Total Revenue

### Customer & Geography
- Map or bar chart: Country vs Total Revenue
- Bar chart: CustomerID vs Total Revenue
- Table: CustomerID, Orders, Revenue

## Design goal
Keep the dashboard clean and recruiter-friendly:
- 3–5 KPI cards at the top
- 2–4 primary charts per page
- Consistent formatting
- Clear titles
- Avoid unnecessary visuals
