# Sample Data

Four synthetic datasets for prototyping during the Abu Dhabi AI PropTech Challenge.

> **Synthetic data notice:** every row in these files was generated for this event. District names are real places, but all values — sizes, prices, scores, populations — are invented. Nothing here is real market, government, or personal data. Do not cite it as fact.

| File | Rows | What it covers | Primary tracks |
|---|---|---|---|
| [`sample_parcels.csv`](sample_parcels.csv) | 30 | Land parcels: zoning, status, scores, value | Land Intelligence |
| [`sample_investors.csv`](sample_investors.csv) | 30 | Investor mandates: type, sector, capital, risk | Investment Intelligence |
| [`sample_transactions.csv`](sample_transactions.csv) | 30 | Property transactions: asset, value, price/sqm | Investment Intelligence |
| [`sample_communities.csv`](sample_communities.csv) | 30 | Community metrics: population, services, mobility | Future Communities |

All four datasets share the `district` column, so they join cleanly for cross-cutting (Decision Intelligence) prototypes.

Column-by-column definitions: [`../docs/datasets.md`](../docs/datasets.md)
Guided exploration: [`../notebooks/explore_sample_data.ipynb`](../notebooks/explore_sample_data.ipynb)

## Quick load

```python
import pandas as pd

parcels      = pd.read_csv("sample_parcels.csv")
investors    = pd.read_csv("sample_investors.csv")
transactions = pd.read_csv("sample_transactions.csv", parse_dates=["date"])
communities  = pd.read_csv("sample_communities.csv")
```

License: MIT — use, modify, and extend freely during and after the event.
