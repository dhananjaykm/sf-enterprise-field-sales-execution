#!/usr/bin/env python3
import csv
from pathlib import Path
out = Path(__file__).parent / "generated"
out.mkdir(exist_ok=True)
def w(name, headers, rows):
    with (out / name).open("w", newline="") as f:
        wr = csv.DictWriter(f, fieldnames=headers); wr.writeheader(); wr.writerows(rows)
w("Account.csv", ["Name", "Outlet_Segment__c"], [{"Name": f"Outlet {i:04d}", "Outlet_Segment__c": ["GOLD","SILVER","BRONZE"][i%3]} for i in range(1, 1001)])
w("Sales_Beat__c.csv", ["Day_of_Week__c", "Is_Active__c", "Region__c"],
  [{"Day_of_Week__c": ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"][i%6], "Is_Active__c": "true", "Region__c": f"R{i%10}"} for i in range(1, 101)])
print("Wrote 1000 outlets and 100 beats; generate 20k visits via Bulk API after beat/stop load")
