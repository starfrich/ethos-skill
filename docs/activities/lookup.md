# Activities — Lookup

Base: `https://api.ethos.network/api/v2/activities`

## GET `/{activityType}/{id}`

Fetch single activity by type and ID.

- `activityType`: see activity types in `getting-started/overview.md`
- `id`: integer (0–2147483647)

## POST `/bulk`

Batch-fetch activities.

```json
{ "activityType": "review", "id": 123 }
```

## GET `/{activityType}/tx/{txHash}`

Lookup by blockchain transaction hash. Pattern: `^0x[a-fA-F0-9]{64}$`

## GET `/userkey`

Get activities by userkey (as author or subject).

| Param             | Type       | Required | Notes                                                                                       |
| ----------------- | ---------- | -------- | ------------------------------------------------------------------------------------------- |
| `userkey`         | string     | yes      |                                                                                             |
| `activityType`    | array      | yes      | uppercase enum                                                                              |
| `direction`       | enum       | no       | `author` or `subject`                                                                       |
| `orderBy`         | enum       | no       | `createdAt`, `totalVotes`, `netVotes`, `replyCount`, `authorScore`, `subjectScore`, `votes` |
| `sort`            | enum       | no       | `asc` or `desc` (default: `desc`)                                                           |
| `reviewScore`     | enum/array | no       | `NEGATIVE`, `NEUTRAL`, `POSITIVE`                                                           |
| `includeArchived` | boolean    | no       |                                                                                             |
| `excludeSpam`     | boolean    | no       |                                                                                             |
| `limit`           | integer    | no       | max 1000, default 50                                                                        |
| `offset`          | number     | no       | default 0                                                                                   |
