# Markets — Query

Base: `https://api.ethos.network/api/v2/markets`

## Market Object

```json
{
  "id": 0,
  "creatorAddress": "string",
  "positivePrice": "string",
  "negativePrice": "string",
  "trustVotes": 0,
  "distrustVotes": 0,
  "basePrice": "string",
  "creationCost": "string",
  "liquidity": "string",
  "configType": "VOLATILE|NORMAL|INSULATED",
  "user": {}
}
```

---

## GET `/markets`

List markets with pagination.

| Param            | Type    | Required | Notes                                                                                                                                                          |
| ---------------- | ------- | -------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `orderBy`        | enum    | no       | `marketCapWei\|volumeTotalWei\|volume24hWei\|trustRatio\|distrustRatio\|score\|createdAt\|priceChange24hPercent\|marketCapChange24hPercent\|scoreDifferential` |
| `orderDirection` | enum    | no       | `asc\|desc` (default: `desc`)                                                                                                                                  |
| `dayRange`       | integer | no       | 1–90                                                                                                                                                           |
| `filterQuery`    | string  | no       | 2–100 chars                                                                                                                                                    |
| `limit`          | integer | no       | max 100, default 50                                                                                                                                            |
| `offset`         | number  | no       | default 0                                                                                                                                                      |

## GET `/markets/featured`

Featured markets. Returns array of Market objects.

## GET `/markets/{profileId}/info`

Enhanced market info for a profile. Optionally includes top holders and market change data.

## GET `/markets/{profileId}/holders`

Market holders with user data.

## GET `/markets/{profileId}/price/history`

Price history for chart with advanced features.

## GET `/markets/{profileId}/change`

Market cap or price change data over specified days. Supports market cap and price change calculations.

## GET `/markets/info/bulk`

Bulk fetch market info for multiple profiles.

## GET `/markets/configs`

Available market configurations (VOLATILE, NORMAL, INSULATED settings).
