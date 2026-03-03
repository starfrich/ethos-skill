# AI Images — Manage (Admin only 🔒)

Base: `https://api.ethos.network/api/v2`

Job statuses: `PENDING | PROCESSING | COMPLETED | FAILED`
Job types: `SLASH | BROKER`

## GET `/ai-images`

List jobs. Query: `status`, `jobType`, `limit`, `offset`.

## GET `/ai-images/{jobId}`

Single job with nested `AiImages[]`.

## GET `/ai-images/by-entity`

Query: `entityType` (required), `entityId` (required).

## GET `/ai-images/selected`

Public. Returns selected job for entity (nullable).

## POST `/ai-images/regenerate`

```json
{ "jobId": 1, "markAsSelected": false, "promptOverride": "optional", "imageUrlOverrides": [] }
```

## POST `/ai-images/activate`

```json
{ "jobId": 1 }
```

Returns `{ "success": true }`.

## POST `/ai-images/retry`

Retry a failed job. Same request/response as `/activate`.
