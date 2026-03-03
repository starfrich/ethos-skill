# Activities — Feed

Base: `https://api.ethos.network/api/v2/activities`

## POST `/feed`

Feed-optimized activity list.

```json
{
  "cache": false,
  "dayRange": null,
  "excludeSpam": true,
  "filter": ["review", "vouch"],
  "orderBy": { "field": "timestamp", "direction": "desc" },
  "limit": 50,
  "offset": 0
}
```

`orderBy.field` options: `timestamp | votes | comments | score | controversial | hot | distance`

## POST `/notifications` 🔒

Notifications feed. Same structure as `/feed` with additional `pagination` wrapper.

```json
{
  "pagination": { "limit": 50, "offset": 0 },
  "filter": ["review"],
  "excludeHistorical": false,
  "excludeSpam": true,
  "orderBy": { "field": "timestamp", "direction": "desc" }
}
```

Response includes extra fields: `offsets` and `counts` per activity type.
