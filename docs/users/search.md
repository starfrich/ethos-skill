# Users — Search & Other

Base: `https://api.ethos.network/api/v2`

## GET `/users/search`

Search users by query string.

| Param         | Type    | Required | Notes                                                             |
| ------------- | ------- | -------- | ----------------------------------------------------------------- |
| `query`       | string  | yes      | 2–100 chars                                                       |
| `userKeyType` | enum    | no       | `ADDRESS\|DISCORD\|FARCASTER\|GITHUB\|TELEGRAM\|TWITTER\|PROFILE` |
| `limit`       | integer | no       | max 50, default 50                                                |
| `offset`      | number  | no       | default 0                                                         |

Response: `{ values: User[], total, limit, offset }`

---

## GET `/users/{userkey}/categories`

Get categories assigned to a user.

---

## Refresh Endpoints 🔒

### POST `/users/refresh/twitter`

Refresh own Twitter data.

### POST `/users/{userkey}/refresh/twitter`

Refresh Twitter data for any user (admin only).

### POST `/users/{userkey}/refresh/streak`

Refresh XP streak for any user (admin only).
