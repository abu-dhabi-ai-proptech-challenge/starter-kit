# Abu Dhabi AI City Challenge — Starter Kit

**Building the Intelligence Layer for Land, Investment and Communities**

A one-day AI challenge hosted by **Cursor** and **eVoost AI** at **Hub71, Abu Dhabi**. In a single day, teams design and ship working AI prototypes that make a city's land, capital, and communities easier to understand and act on.

This repo is your starting point: the challenge brief, the tracks, synthetic datasets, runnable example agents, and everything you need to go from idea to demo.

## Event details

| | |
|---|---|
| **Format** | One-day, in-person AI challenge |
| **Venue** | Hub71, Abu Dhabi |
| **Hosts** | Cursor × eVoost AI |
| **Teams** | 2–5 people |
| **Deliverable** | Working prototype + 3-minute demo |
| **Submission** | GitHub Issue in the [`submissions`](GITHUB_ORG_URL/submissions) repo |

## Challenge tracks

| Track | Build something that... |
|---|---|
| 🗺️ **Land Intelligence** | Understands land — scoring parcels, recommending land use, surfacing development potential |
| 💼 **Investment Intelligence** | Connects capital to opportunity — matching investors to assets, analyzing market signals |
| 🏙️ **Future Communities** | Improves how people live — service demand, mobility, resident experience |
| 🧭 **Decision Intelligence** | Helps decision-makers act — copilots, briefings, scenario analysis across city data |

Full details in [`docs/tracks.md`](docs/tracks.md).

## Quick start

```bash
# 1. Clone this kit
git clone GITHUB_ORG_URL/starter-kit.git
cd starter-kit

# 2. Explore the sample data
pip install pandas jupyter
jupyter notebook notebooks/explore_sample_data.ipynb

# 3. Run an example agent
cd examples/land-intelligence-agent
pip install -r requirements.txt
python main.py
```

Want a web app instead? Generate a repo from the [`project-template`](GITHUB_ORG_URL/project-template) — a Next.js + TypeScript + Tailwind dashboard ready for your prototype.

## Datasets

Four synthetic datasets in [`data/`](data/), modeled on the kinds of signals a city intelligence layer works with:

| File | Rows | Describes |
|---|---|---|
| `sample_parcels.csv` | 30 | Land parcels: zoning, size, status, infrastructure and potential scores |
| `sample_investors.csv` | 30 | Investor profiles: type, sector, capital range, risk, horizon |
| `sample_transactions.csv` | 30 | Property transactions: asset type, value, size, price per sqm |
| `sample_communities.csv` | 30 | Community metrics: population, occupancy, services, mobility, experience |

All data is **synthetic** — generated for this challenge, containing no real personal or commercial information. Column definitions in [`docs/datasets.md`](docs/datasets.md). You're welcome to bring your own public datasets too.

## How to submit

1. Build in your own repo (or from the [`project-template`](GITHUB_ORG_URL/project-template)).
2. Before the deadline, open an Issue in [`submissions`](GITHUB_ORG_URL/submissions) using the **Project Submission** form.
3. Include your repo link, demo link, and what you built during the day.

Full instructions: [`docs/submission-guide.md`](docs/submission-guide.md). Judging criteria: [`docs/judging-criteria.md`](docs/judging-criteria.md).

## Repo map

```
docs/        Challenge brief, tracks, datasets, judging, submission guide, FAQ
data/        Synthetic CSV datasets
examples/    Three runnable example agents (no API keys required)
notebooks/   Jupyter notebook to explore the data
assets/      Brand assets
```

## Links

- 🌐 Website: WEBSITE_URL
- 💬 Discord: DISCORD_URL
- 🐙 GitHub Org: GITHUB_ORG_URL
- 🤗 Hugging Face: HUGGINGFACE_URL
- 📝 Registration: REGISTER_URL

## Code of conduct

Be excellent to each other. Full text: [`docs/code-of-conduct.md`](docs/code-of-conduct.md).

---

Licensed under the [MIT License](LICENSE).
