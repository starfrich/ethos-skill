# XP — User

Base: `https://api.ethos.network/api/v2/xp`

## GET `/xp/user/{userkey}`

Total XP across all seasons.

## GET `/xp/user/{userkey}/season/{seasonId}`

XP for a user in a specific season.

## GET `/xp/user/{userkey}/season/{seasonId}/weekly`

Weekly XP breakdown for a user in a specific season.

## GET `/xp/user/{userkey}/season/{seasonId}/timeline`

Time-bucketed XP timeline.

| Param         | Type   | Required | Notes                 |
| ------------- | ------ | -------- | --------------------- |
| `granularity` | enum   | yes      | `hour \| day \| week` |
| `since`       | string | no       | ISO datetime          |

Response:

```json
[{ "time": "string", "xp": 0, "cumulativeXp": 0 }]
```

## GET `/xp/user/{userkey}/leaderboard-rank`

User's rank on the XP leaderboard.
