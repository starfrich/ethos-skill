# Score — Concepts

## Credibility Score

Range 0–2800. Calculated from:

- Received vouches (weight = ETH amount × voucher's influence factor)
- Received reviews (POSITIVE increases, NEGATIVE decreases)
- Human verification status
- Own influence factor

User object fields: `score`, `influenceFactor`, `influenceFactorPercentile`

## Score Levels

| Level           | Description |
| --------------- | ----------- |
| `untrusted`     | Lowest      |
| `questionable`  |             |
| `neutral`       | Default     |
| `known`         |             |
| `established`   |             |
| `reputable`     |             |
| `exemplary`     |             |
| `distinguished` |             |
| `revered`       |             |
| `renowned`      | Highest     |

## Slash Supporter Penalties

### GET `/slash/supporter-penalties/{profileId}`

Supporter penalties with enriched slash/subject data for a profile.

Path: `profileId` (integer, 1–2147483647)

```json
[
  {
    "id": 0,
    "slashId": 0,
    "penaltyAmount": 0,
    "createdAt": "string",
    "reason": "vouch",
    "slash": {}
  }
]
```

`reason` enum: `vouch | review`
