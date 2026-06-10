# Challenge Tracks

Four tracks, one question each. Pick the one that fits your team — depth beats breadth.

---

## 🗺️ Track 1: Land Intelligence

**How can AI make land understandable?**

Land is the city's base layer, but raw parcel data — zoning codes, sizes, statuses — doesn't tell anyone what to do. Build something that turns parcel data into judgment.

**Example directions**

- A parcel scoring engine that ranks development potential and explains its reasoning
- A land-use recommender: given a parcel, what should be built there and why
- A natural-language interface over parcel data ("show me underused commercial land near high-demand districts")
- An anomaly finder that flags parcels whose status, value, or use looks inconsistent

**Relevant data:** `sample_parcels.csv`, `sample_transactions.csv`
**Example code:** [`examples/land-intelligence-agent/`](../examples/land-intelligence-agent/)

---

## 💼 Track 2: Investment Intelligence

**How can AI connect capital to opportunity?**

Investors have mandates; cities have assets. Matching them today is manual, slow, and relationship-driven. Build something that does it with intelligence.

**Example directions**

- An investor–opportunity matching engine that pairs mandates with parcels or assets, with explained fit scores
- A market signal analyzer over transaction data: trends, momentum, pricing anomalies by district
- A deal memo generator: given an asset and an investor profile, draft the one-page investment case
- A portfolio construction tool that assembles district/asset mixes to fit a risk profile

**Relevant data:** `sample_investors.csv`, `sample_transactions.csv`, `sample_parcels.csv`
**Example code:** [`examples/investment-matching-agent/`](../examples/investment-matching-agent/)

---

## 🏙️ Track 3: Future Communities

**How can AI improve how people live?**

Communities generate demand for services, mobility, and experience — and the data to see it. Build something that helps a city respond before residents have to complain.

**Example directions**

- A service demand forecaster: where will schools, clinics, or retail be under- or over-supplied
- A mobility insight tool that finds districts where movement scores lag and proposes interventions
- A resident experience dashboard that explains *why* a community scores low and what would move it
- A community matching tool: given a household profile, which district fits best and why

**Relevant data:** `sample_communities.csv`, `sample_parcels.csv`

---

## 🧭 Track 4: Decision Intelligence

**How can AI help decision-makers act?**

The hardest part of city data isn't collecting it — it's getting a clear answer out of it at the moment a decision is made. Build the layer between the data and the decision.

**Example directions**

- A decision copilot that answers cross-dataset questions in plain language, with sources
- An automated morning briefing: what changed across land, investment, and communities, and what needs attention
- A scenario tool: "if district X adds 5,000 residents, what happens to services, land demand, and prices?"
- A recommendation engine that proposes the next three actions for a given district, with evidence

**Relevant data:** all four datasets
**Example code:** [`examples/decision-copilot/`](../examples/decision-copilot/)

---

## Choosing a track

- You submit under **one** track (selected in the submission form).
- Cross-cutting projects are welcome — pick the track that names your primary user.
- Judges score within tracks for track prizes and across tracks for Best Overall.
