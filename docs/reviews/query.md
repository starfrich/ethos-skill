# Reviews — Query

Base: `https://api.ethos.network/api/v2/reviews`

## Concepts

- Values: `POSITIVE | NEUTRAL | NEGATIVE`
- Tracked via `stats.review.received.positive/neutral/negative` on user object
- Activity type: `review`

---

## GET `/reviews/count/between`

Get review count between two users.

| Param            | Type   | Required |
| ---------------- | ------ | -------- |
| `authorUserkey`  | string | yes      |
| `subjectUserkey` | string | yes      |

---

## GET `/reviews/latest/between`

Get latest review between two users.

| Param            | Type   | Required |
| ---------------- | ------ | -------- |
| `authorUserkey`  | string | yes      |
| `subjectUserkey` | string | yes      |
