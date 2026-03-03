# Wallets — Authentication

Base: `https://api.ethos.network/api/v2`

## POST `/auth/exchange`

Exchange Privy session token for Ethos JWTs.

## POST `/auth/logout`

Logout and clear Ethos JWT cookies.

## GET `/wallets/privy/auth-check`

Verify authentication and wallet access.

Returns: `{ ok: boolean, profileId?: number }`

Always call before any wallet operation. Auto-refreshes expired tokens.

## GET `/wallets/funds-check`

Check if wallet has enough funds for transactions.
