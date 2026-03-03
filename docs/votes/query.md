# Votes — Query

Base: `https://api.ethos.network/api/v2`

## GET `/votes`

Get votes for an activity.

| Param          | Type    | Required |
| -------------- | ------- | -------- |
| `activityType` | enum    | yes      |
| `id`           | integer | yes      |

## GET `/votes/stats`

Get aggregated vote stats for a single activity.

| Param          | Type    | Required |
| -------------- | ------- | -------- |
| `activityType` | enum    | yes      |
| `id`           | integer | yes      |

## POST `/votes/stats`

Get aggregated vote stats for multiple activities.

```json
[{ "activityType": "review", "id": 123 }]
```
