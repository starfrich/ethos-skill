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

### POST `/wallets/activity/review/{id}/archive` 🔒

Archive a review via wallet.

---

## Social Actions

### POST `/wallets/activity/{activityType}/{id}/vote`

Vote on activity. Types: `attestation|bond|broker-post|human-verification|invitation-accepted|market|market-vote|open-slash|closed-slash|project|reply|review|slash|unvouch|vouch|vote|xp-tip`

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

### POST `/wallets/privy/invite/address` 🔒

Invite an Ethereum address.

### POST `/wallets/privy/invite/cancel` 🔒

Cancel a pending invite.

---

## Bonds

### POST `/wallets/privy/bonds` 🔒

Create a bond. Requires signature from `POST /signatures/humanity-bond` first.

### POST `/wallets/activity/bond/{bondId}/archive` 🔒

Archive a bond.
