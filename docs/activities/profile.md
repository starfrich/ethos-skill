# Activities — Profile

Base: `https://api.ethos.network/api/v2/activities`

All profile endpoints share this request body schema:

| Field               | Type       | Required | Notes                             |
| ------------------- | ---------- | -------- | --------------------------------- |
| `userkey`           | string     | yes      |                                   |
| `filter`            | array      | no       | activity type enum                |
| `excludeHistorical` | boolean    | no       |                                   |
| `excludeSpam`       | boolean    | no       |                                   |
| `orderBy`           | object     | no       | `{ field, direction }`            |
| `reviewScore`       | enum/array | no       | `NEGATIVE`, `NEUTRAL`, `POSITIVE` |
| `minAuthorScore`    | integer    | no       | 1–2800                            |
| `limit`             | integer    | no       | max 1000, default 50              |
| `offset`            | number     | no       | default 0                         |

## POST `/profile/given`

Activities authored by a user. Required: `userkey`.

## POST `/profile/received`

Activities where user is the subject. Same schema as `/given`.

## POST `/profile/all`

Combined authored + received. Same schema.

## POST `/project`

Project-related activities for a user. Same schema as profile endpoints.

## GET `/slash/{slashId}/impacted-supporters`

Paginated supporters affected by a slash event.

| Param     | Type    | Required   |
| --------- | ------- | ---------- |
| `slashId` | integer | yes (path) |
| `limit`   | integer | no         |
| `offset`  | number  | no         |

Response includes `penaltyAmount` per supporter alongside full user object.
