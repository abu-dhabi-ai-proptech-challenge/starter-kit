# Datasets

Four synthetic CSV datasets live in [`data/`](../data/). They are designed to be joined on `district`, so cross-dataset prototypes are easy to build.

> **All data is synthetic.** It was generated for this challenge and contains no real personal, commercial, or government information. Values are plausible but not real — do not present them as actual Abu Dhabi market data.

## sample_parcels.csv

Land parcels with zoning, status, and AI-friendly scores.

| Column | Type | Description |
|---|---|---|
| `parcel_id` | string | Unique ID, e.g. `PRC-0001` |
| `district` | string | District name (join key across datasets) |
| `zone` | string | Zoning code, e.g. `Z-RES-02`, `Z-MIX-01` |
| `land_use` | string | `residential`, `commercial`, `mixed_use`, `industrial`, `hospitality`, `community` |
| `parcel_size_sqm` | int | Parcel area in square meters |
| `current_status` | string | `vacant`, `under_development`, `developed`, `reserved` |
| `infrastructure_score` | int (0–100) | Quality of surrounding infrastructure |
| `development_potential_score` | int (0–100) | Modeled development upside |
| `estimated_value_aed` | int | Estimated parcel value in AED |
| `recommended_use` | string | Model-suggested best use |

## sample_investors.csv

Investor profiles with mandates and constraints.

| Column | Type | Description |
|---|---|---|
| `investor_id` | string | Unique ID, e.g. `INV-001` |
| `investor_type` | string | `sovereign_fund`, `institutional`, `private_equity`, `family_office`, `developer`, `reit`, `hnwi` |
| `preferred_sector` | string | Target sector, e.g. `residential`, `hospitality`, `logistics` |
| `preferred_district` | string | Preferred district (join key) |
| `capital_range_aed` | string | Deployable capital band, e.g. `50M-200M` |
| `risk_profile` | string | `conservative`, `balanced`, `aggressive` |
| `investment_horizon` | string | `short` (<3y), `medium` (3–7y), `long` (>7y) |
| `strategic_fit_score` | int (0–100) | Modeled alignment with city development priorities |

## sample_transactions.csv

Recent property transactions.

| Column | Type | Description |
|---|---|---|
| `transaction_id` | string | Unique ID, e.g. `TXN-0001` |
| `date` | date | Transaction date (`YYYY-MM-DD`) |
| `district` | string | District name (join key) |
| `asset_type` | string | `land`, `apartment`, `villa`, `office`, `retail`, `warehouse`, `hotel` |
| `transaction_value_aed` | int | Total transaction value in AED |
| `size_sqm` | int | Asset size in square meters |
| `price_per_sqm` | int | Value ÷ size, in AED |
| `buyer_type` | string | `individual`, `corporate`, `fund`, `developer` |

## sample_communities.csv

Community-level quality-of-life metrics.

| Column | Type | Description |
|---|---|---|
| `community_id` | string | Unique ID, e.g. `COM-001` |
| `district` | string | District name (join key) |
| `population_estimate` | int | Estimated residents |
| `occupancy_rate` | float (0–1) | Share of housing stock occupied |
| `service_demand_index` | int (0–100) | Pressure on schools, clinics, retail (higher = more unmet demand) |
| `mobility_score` | int (0–100) | Quality of transport and accessibility |
| `resident_experience_score` | int (0–100) | Modeled resident satisfaction |
| `optimization_opportunity` | string | Highest-leverage improvement, e.g. `expand_school_capacity` |

## Working with the data

```python
import pandas as pd

parcels = pd.read_csv("data/sample_parcels.csv")
communities = pd.read_csv("data/sample_communities.csv")

# Join on district to relate land supply to community demand
merged = parcels.merge(communities, on="district")
```

A guided walkthrough lives in [`notebooks/explore_sample_data.ipynb`](../notebooks/explore_sample_data.ipynb).

## Bring your own data

You may also use public datasets (open government data, OpenStreetMap, public market indices) or generate synthetic data. Do **not** use scraped private data or any real personal information.
