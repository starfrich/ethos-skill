# Vouches — Query

Base: `https://api.ethos.network/api/v2/vouches`

## Concepts

- Vouching = staking ETH as proof of trust
- Increases score for both parties
- Amount is in **Wei** (int64) — always convert when displaying
- Activity types: `vouch`, `unvouch`

---

## POST `/vouches` (beta)

> Beta — may change without notice.

| Field                      | Type        | Required | Notes               |
| -------------------------- | ----------- | -------- | ------------------- |
| `ids`                      | number[]    | no       | Filter by vouch IDs |
| `subjectUserkeys`          | string[]    | no       |                     |
| `authorProfileIds`         | integer[]   | no       | 1–2147483647        |
| `subjectProfileIds`        | integer[]   | no       | 1–2147483647        |
| `subjectAddresses`         | string[]    | no       |                     |
| `subjectAttestationHashes` | any[]       | no       |                     |
| `archived`                 | boolean     | no       |                     |
| `afterDate`                | string      | no       |                     |
| `orderBy.balance`          | `asc\|desc` | no       |                     |
| `orderBy.vouchedAt`        | `asc\|desc` | no       |                     |
| `orderBy.updatedAt`        | `asc\|desc` | no       |                     |
| `duration`                 | string      | no       |                     |
| `limit`                    | integer     | no       | max 100, default 50 |
| `offset`                   | number      | no       | default 0           |

Response:

```json
{
  "values": [
    {
      "authorProfileId": 0,
      "subjectProfileId": 0,
      "authorUser": {},
      "subjectUser": {}
    }
  ],
  "total": 0,
  "limit": 50,
  "offset": 0
}
```

---

## GET `/vouches/mutual-vouchers`

Mutual vouchers between two profiles.

| Param             | Type    | Required |
| ----------------- | ------- | -------- |
| `viewerProfileId` | integer | yes      |
| `targetProfileId` | integer | yes      |

---

## GET `/vouches/fees`

Current vouch fee structure.

```json
{
  "entryDonationFeeBasisPoints": 0,
  "entryProtocolFeeBasisPoints": 0,
  "entryVouchersPoolFeeBasisPoints": 0,
  "exitFeeBasisPoints": 0
}
```

All values in basis points (100 = 1%).
