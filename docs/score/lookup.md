# Score — Lookup

Base: `https://api.ethos.network/api/v2/score`

## Score Object

```json
{ "score": 0, "level": "neutral" }
```

`level` enum: `untrusted | questionable | neutral | known | established | reputable | exemplary | distinguished | revered | renowned`

Numeric range: 0–2800. `score` may be absent if not yet calculated.

---

## GET `/score/address`

Get score by Ethereum address.

| Param                | Type    | Required |
| -------------------- | ------- | -------- |
| `address`            | string  | yes      |
| `triggerCalculation` | boolean | no       |

## POST `/score/addresses`

Bulk scores by addresses.

```json
{ "addresses": ["0x..."], "triggerCalculation": false }
```

Response: map of address → Score Object

```json
{ "0xabc...": { "score": 0, "level": "neutral" } }
```

---

## GET `/score/userId`

| Param    | Type    | Required           |
| -------- | ------- | ------------------ |
| `userId` | integer | yes (1–2147483647) |

## POST `/score/userIds`

```json
{ "userIds": [1, 2, 3] }
```

Response: map of userId (string key) → Score Object

---

## GET `/score/userkey`

| Param                | Type    | Required |
| -------------------- | ------- | -------- |
| `userkey`            | string  | yes      |
| `triggerCalculation` | boolean | no       |

## POST `/score/userkeys`

```json
{ "userkeys": ["profileId:123", "address:0x..."], "triggerCalculation": false }
```

Response: map of userkey → Score Object

---

## GET `/score/updates`

Users with score updates since a timestamp.

| Param    | Type    | Required | Notes                     |
| -------- | ------- | -------- | ------------------------- |
| `after`  | string  | yes      | ISO timestamp lower bound |
| `until`  | string  | no       | ISO timestamp upper bound |
| `limit`  | integer | no       | max 1000, default 50      |
| `offset` | number  | no       | default 0                 |

Response: `{ values: [{ userkey, lastUpdatedAt }], total, limit, offset }`

---

## GET `/score/status`

Check score calculation status.

| Param     | Type   | Required |
| --------- | ------ | -------- |
| `userkey` | string | yes      |

```json
{
  "status": "idle",
  "isQueued": false,
  "isCalculating": false,
  "isPending": false
}
```

`status` enum: `idle | queued | calculating`
