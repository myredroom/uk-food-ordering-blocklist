# UK food ordering blocklist

A DNS blocklist for people in the UK who want to stop ordering takeaways and
convenience-store deliveries.

It blocks the big marketplaces (Just Eat, Deliveroo, Uber Eats) **and** the
platforms that local takeaways use for their own branded websites and apps
(Hungrrr, Flipdish, Foodhub, Yoyumm and others). That second part is what
general-purpose lists miss: your local chip shop's "own" app is usually one of
these platforms underneath, so blocking the platform stops ordering from every
takeaway that uses it.

## Use it

Add this URL as a blocklist:

```
https://github.com/myredroom/uk-food-ordering-blocklist/releases/latest/download/uk-food-ordering.txt
```

- **Pi-hole v6:** Lists → add the URL → then run *Update Gravity*.
- **AdGuard Home:** Filters → DNS blocklists → Add blocklist → Add a custom list.
- **uBlock Origin** (browser only): Filter lists → Import.

The list uses `||domain^` entries, which block each domain and all of its
subdomains. Pi-hole v5 does not understand this format; use v6.

## What it doesn't do

- **Tesco Whoosh** can't be blocked by DNS: it's part of tesco.com and the
  Tesco app, so blocking it would break Tesco entirely.
- **Phoning a takeaway** isn't something DNS can stop.
- DNS blocking only applies to devices using your blocker. A phone on mobile
  data bypasses a home Pi-hole unless its traffic comes home through a VPN.

## Rules for the list

- **Platforms, not individual takeaways.** If a takeaway gets through, find
  out which platform takes its orders (your blocker's query log will show it)
  and add the platform.
- **Never payment processors** (Stripe, Adyen, PayPal, Worldpay...). Blocking
  them would break all online shopping.
- **Check for collateral damage.** Example: Uber Eats is blocked but uber.com
  is not, because Uber taxis use it.

Missing a platform? Open an issue with the platform name and a takeaway that
uses it.

## Licence

CC0 1.0: public domain. Use it however you like.
