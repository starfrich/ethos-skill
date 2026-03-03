# XP — Seasons

Base: `https://api.ethos.network/api/v2/xp`

## GET `/xp/seasons`

All XP seasons plus current season info.

```json
{
  "seasons": [{ "id": 0, "name": "string", "startDate": "string" }],
  "currentSeason": {
    "id": 0,
    "name": "string",
    "startDate": "string",
    "week": 0
  }
}
```

## GET `/xp/season/{seasonId}/weeks`

All weeks in a season with date ranges.

```json
[{ "week": 0, "startDate": "string", "endDate": "string" }]
```
