#!/bin/bash
# How many times each release's list has been downloaded (GitHub counts these;
# a Pi-hole re-downloads weekly, so one user is roughly one download a week).
gh api repos/myredroom/uk-food-ordering-blocklist/releases \
  --jq '.[] | "\(.tag_name)  \(.assets[0].download_count) downloads"'
