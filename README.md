# sf-enterprise-field-sales-execution

Legacy field-sales execution (beats, visits, retail audit, collections, expenses, onboarding). **No Flow metadata.**

GPS completion rules, route optimization, and offline sync are intentional Apex-required / do-not-migrate examples.

```bash
sf org create scratch -f config/project-scratch-def.json -a field-sales
sf project deploy start -o field-sales
python3 scripts/seed-data/generate_seed.py
```
