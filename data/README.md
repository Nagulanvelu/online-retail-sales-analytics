# Dataset Setup

This project uses the **UCI Online Retail** dataset.

Official source:
https://archive.ics.uci.edu/dataset/352/online+retail

The dataset contains 541,909 transactions from a UK-based registered non-store online retailer between 01/12/2010 and 09/12/2011.

## Option A — Download manually
1. Open the UCI page above.
2. Download `Online Retail.xlsx`.
3. Place it in this `data/` folder.
4. Run:
```bash
python python/preprocess.py
```

## Option B — Download through Python
The preprocessing script can fetch dataset ID 352 using `ucimlrepo`.

Do not upload the original 22.6 MB Excel file to GitHub unless you specifically want to and have checked repository size/licensing requirements.
