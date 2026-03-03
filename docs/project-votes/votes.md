# Project Votes

Base: `https://api.ethos.network/api/v2/projects`

## POST `/projects/{projectId}/votes` 🔒

Cast a vote for a project.

## GET `/projects/votes/balance` 🔒

Get current user's vote balance, optionally for a specific project and season.

| Param       | Type    | Required |
| ----------- | ------- | -------- |
| `projectId` | integer | no       |
| `seasonId`  | integer | no       |

## GET `/projects/{projectId}/voters`

Paginated list of project voters with vote statistics.

### Time Scope (`scope` param)

| scope            | Additional params required         |
| ---------------- | ---------------------------------- |
| `global`         | none — all-time data               |
| `global-dates`   | `startDate` + `endDate` (ISO date) |
| `current-period` | none — default                     |
| `period`         | `year` + `period` (numbers)        |

Examples:

```
GET /projects/123/voters?scope=global
GET /projects/123/voters?scope=global-dates&startDate=2024-01-01&endDate=2024-12-31
GET /projects/123/voters?scope=period&year=2024&period=3
```

## GET `/projects/{projectId}/bulk-totals`

Bulk user vote totals with flexible time range. Same `scope` options as `/voters`.

## GET `/projects/{projectId}/chart`

Vote chart data with time range and aggregation options. Same `scope` options as `/voters`.

### Bucket (time aggregation)

`1 minute | 5 minutes | 15 minutes | 30 minutes | 1 hour | 2 hours | 6 hours | 12 hours | 1 day | 1 week | 1 month`

If omitted, API auto-selects optimal bucket. Max 2000 data points.

## POST `/projects/votes/reallocate` 🔒 (admin)

Reallocate votes for all users.

| `type`            | Description                                     |
| ----------------- | ----------------------------------------------- |
| `reset` (default) | Advance to next period and allocate fresh votes |
| `reallocate`      | Allocate additional votes for current period    |
