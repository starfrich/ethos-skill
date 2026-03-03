# Markets — Simulate & Users

Base: `https://api.ethos.network/api/v2/markets`

## POST `/markets/simulate-buy`

Simulate a buy transaction to calculate expected output without executing on-chain.

---

## Market User Lookups

### GET `/markets/users/by/address/{address}`

Market user info by Ethereum address.

### GET `/markets/users/by/x/{username}`

Market user info by Twitter username.

### POST `/markets/users/by/addresses`

Bulk lookup market users by Ethereum addresses.

```json
{ "addresses": ["0x..."] }
```
