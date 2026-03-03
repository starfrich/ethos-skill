# Replies — Query

Base: `https://api.ethos.network/api/v2/replies`

## Reply Schema

| Field             | Type        | Notes                                                                                    |
| ----------------- | ----------- | ---------------------------------------------------------------------------------------- |
| `id`              | integer     |                                                                                          |
| `contractType`    | enum        | `attestation\|bond\|broker\|discussion\|review\|slash\|vouch\|project\|reputationMarket` |
| `targetContract`  | string      |                                                                                          |
| `parentId`        | integer     |                                                                                          |
| `authorProfileId` | integer     |                                                                                          |
| `createdAt`       | string      | ISO datetime                                                                             |
| `content`         | string      |                                                                                          |
| `metadata`        | object      |                                                                                          |
| `pinned`          | boolean     |                                                                                          |
| `user`            | User object |                                                                                          |
| `url`             | string      |                                                                                          |

---

## GET `/replies/by-id` (beta)

Fetch multiple replies by ID array.

| Param | Type      | Required |
| ----- | --------- | -------- |
| `ids` | integer[] | yes      |

Response: `Record<string, Reply | null>` — map of id → Reply (null if not found)

---

## GET `/replies/{contractType}/{parentId}` (beta)

Paginated replies for a parent activity.

| Param            | Type    | Required | Default      |
| ---------------- | ------- | -------- | ------------ |
| `orderBy`        | enum    | no       | `createdAt`  |
| `orderDirection` | enum    | no       | `desc`       |
| `limit`          | integer | no       | 50 (max 500) |
| `offset`         | integer | no       | 0            |

`orderBy` options: `score | createdAt | votes`
