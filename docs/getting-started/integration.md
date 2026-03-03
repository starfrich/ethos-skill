# Integration Guides

---

## Ethos Everywhere Wallet

Managed wallet solution for partner apps. Users post reviews, vote, and reply without wallet popups or gas fees.

### Becoming a Partner

1. Domain verification
2. Security review
3. Clear use case description
4. `X-Ethos-Client` header implemented

Contact: `help@ethos.network` | [Discord](https://discord.gg/trust-ethos) | [@ethos_network](https://x.com/ethos_network)

### Key Endpoints

**GET `/wallets/privy/auth-check`**
Verify authentication and wallet access.
Returns: `{ ok: boolean, profileId?: number }`
Always call before any wallet operation.

**POST `/wallets/privy/post/review`**
Create a review. Required: `subject`, `score`, `title`. Optional: `content`.
Returns: `{ hash, review?, reviewSlug }`

**POST `/wallets/privy/post/review/by-address`**
Create review for an Ethereum address.

**POST `/wallets/privy/post/review/by-x`**
Create review for a Twitter account by ID or username.

**POST `/wallets/activity/{activityType}/{id}/vote`**
Vote on activity. Types: `review|vouch|attestation|slash|broker-post|project|reputation-market|reply`
Body: `{ isUpvote: boolean }`

**POST `/wallets/activity/{activityType}/{id}/reply`**
Reply to activity. Body: `{ content: string, metadata?: object }`

### Code Example

```typescript
// Auth check
const res = await fetch(
  "https://api.ethos.network/api/v2/wallets/privy/auth-check",
  {
    headers: { "X-Ethos-Client": "my-app@1.0.0" },
    credentials: "include",
  },
);
const { ok, profileId } = await res.json();

// Post review by address
const res = await fetch(
  "https://api.ethos.network/api/v2/wallets/privy/post/review/by-address",
  {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "X-Ethos-Client": "my-app@1.0.0",
    },
    credentials: "include",
    body: JSON.stringify({
      address,
      score,
      title,
      waitForReviewTimeoutSeconds: 5,
    }),
  },
);
```

### Error Codes

| Code                     | HTTP | Description                   |
| ------------------------ | ---- | ----------------------------- |
| `UNAUTHENTICATED`        | 401  | User not authenticated        |
| `WALLET_NOT_FOUND`       | 404  | User has no wallet            |
| `INSUFFICIENT_FUNDS`     | 400  | Not enough funds              |
| `NONCE_CONFLICT`         | 409  | Retry request                 |
| `CONTRACT_REVERT`        | 400  | Transaction reverted on-chain |
| `RATE_LIMITED`           | 429  | Exponential backoff           |
| `BLOCKCHAIN_UNAVAILABLE` | 503  | Network unavailable           |

### Best Practices

- Always set `credentials: 'include'`
- Always include `X-Ethos-Client`
- Call `/auth-check` before wallet operations
- On `NONCE_CONFLICT` — retry once
- Set `waitForReviewTimeoutSeconds: 5-10` for review endpoints

---

## Log in with Ethos

Privy-based OAuth letting users sign in with their Ethos Everywhere wallet.

- Demo: https://login-example.ethos.network
- Source: https://github.com/trust-ethos/log-in-with-ethos

### Setup

**1.** Create Privy app at [dashboard.privy.io](https://dashboard.privy.io/account) → copy App ID.

**2.** In Privy: Global wallet → Integrations → enable **Ethos Network**.

**3.** Install SDK:

```bash
npm install @privy-io/react-auth
```

**4.** Initialize:

```jsx
import { PrivyProvider } from "@privy-io/react-auth";

<PrivyProvider
  appId={import.meta.env.PUBLIC_PRIVY_APP_ID}
  config={{
    loginMethodsAndOrder: {
      primary: ["privy:cm5l76en107pt1lpl2ve2ocfy"],
    },
  }}
>
  <App />
</PrivyProvider>;
```

**5.** Trigger login:

```jsx
const { login } = usePrivy();
<button onClick={() => login()}>Sign in with Ethos</button>;
```

---

## Vibe Coding Quickstart (Deno)

```bash
curl -fsSL https://deno.land/install.sh | sh
```

Project structure:

```
src/
  ethos-client.ts   # API wrapper
  main.ts           # Entry point
.env.example
deno.json           # Tasks: dev, check, cron jobs
```

Required header on all requests: `{ "X-Ethos-Client": "your-app-name" }`

Starter endpoints:

```
GET /score/address?address=0x...   # Get credibility score
GET /user/by/address/{address}     # Get user profile
```

Reference repos:

- https://github.com/trust-ethos/ethos-twitter-agent
- https://github.com/trust-ethos/ethos-spiderchart
- https://github.com/trust-ethos/ethos-anonymous-reviews
