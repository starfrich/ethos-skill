# Wallets — Actions (Ethos Everywhere)

Base: `https://api.ethos.network/api/v2/wallets`

All endpoints use cookie-based auth. Always set `credentials: 'include'`.

## Reviews

### POST `/wallets/privy/post/review`

Create a review. Required: `subject`, `score`, `title`. Optional: `content`, `waitForReviewTimeoutSeconds`.

### POST `/wallets/privy/post/review/by-address`

Create review for an Ethereum address.

### POST `/wallets/privy/post/review/by-x`

Create review for a Twitter account by ID or username.

### POST `/wallets/privy/edit/review`

Edit an existing review via wallet.

### POST `/wallets/privy/archive/review`

Archive a review via wallet.

---

## Social Actions

### POST `/wallets/activity/{activityType}/{id}/vote`

Vote on activity. Types: `review|vouch|attestation|slash|broker-post|project|reputation-market|reply`

```json
{ "isUpvote": true }
```

### POST `/wallets/activity/{activityType}/{id}/reply`

Reply to activity.

```json
{ "content": "string", "metadata": {} }
```

---

## Invitations

### POST `/wallets/privy/invite`

Invite an address.

### POST `/wallets/privy/cancel-invite`

Cancel a pending invite.

---

## Bonds

### POST `/wallets/privy/bond`

Create a bond.

### POST `/wallets/privy/archive/bond`

Archive a bond.
