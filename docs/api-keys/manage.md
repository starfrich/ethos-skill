# API Keys — Manage

Base: `https://api.ethos.network/api/v2`

## POST `/api-keys`

Create an API key. Required: `address` (Ethereum address). Optional: `expiresAt` (ISO datetime).

Returns: `{ id, address, createdAt, expiresAt, lastUsedAt }`

## GET `/api-keys` 🔒

List API keys for the authenticated user.

Returns array of `{ id, address, createdAt, expiresAt, lastUsedAt }`.

## DELETE `/api-keys/{id}` 🔒

Revoke an API key by ID. Returns `{ ok: true }`.
