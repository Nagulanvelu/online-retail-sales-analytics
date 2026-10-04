import pandas as pd
from pathlib import Path

DATA_DIR = Path(__file__).resolve().parents[1] / "data"
OUTPUT = DATA_DIR / "online_retail_clean.csv"
EXCEL = DATA_DIR / "Online Retail.xlsx"

def load_data():
    if EXCEL.exists():
        return pd.read_excel(EXCEL)

    try:
        from ucimlrepo import fetch_ucirepo
        dataset = fetch_ucirepo(id=352)
        return dataset.data.features.copy()
    except Exception as exc:
        raise RuntimeError(
            "Dataset not found. Download 'Online Retail.xlsx' from the UCI "
            "Online Retail dataset page and place it in the data folder."
        ) from exc

df = load_data()

df.columns = [c.strip() for c in df.columns]

# Convert types
df["InvoiceDate"] = pd.to_datetime(df["InvoiceDate"], errors="coerce")
df["Quantity"] = pd.to_numeric(df["Quantity"], errors="coerce")
df["UnitPrice"] = pd.to_numeric(df["UnitPrice"], errors="coerce")
df["CustomerID"] = pd.to_numeric(df["CustomerID"], errors="coerce")

# Remove cancellations, invalid quantities/prices, and rows without customer IDs
df = df[~df["InvoiceNo"].astype(str).str.upper().str.startswith("C")]
df = df[df["Quantity"] > 0]
df = df[df["UnitPrice"] > 0]
df = df.dropna(subset=["InvoiceDate", "CustomerID", "Description"])

# Business metric used by the dashboard
df["Revenue"] = df["Quantity"] * df["UnitPrice"]

# Useful time dimensions
df["Year"] = df["InvoiceDate"].dt.year
df["Month"] = df["InvoiceDate"].dt.month
df["MonthName"] = df["InvoiceDate"].dt.strftime("%b")
df["YearMonth"] = df["InvoiceDate"].dt.to_period("M").astype(str)

df.to_csv(OUTPUT, index=False)

print(f"Cleaned rows: {len(df):,}")
print(f"Unique customers: {df['CustomerID'].nunique():,}")
print(f"Unique invoices: {df['InvoiceNo'].nunique():,}")
print(f"Total revenue: £{df['Revenue'].sum():,.2f}")
print(f"Saved to: {OUTPUT}")
