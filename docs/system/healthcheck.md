# System — Healthcheck

Base: `https://api.ethos.network/api/v2`

## GET `/healthcheck`

Health check endpoint.

## GET `/healthcheck/authenticated` 🔒

Authenticated health check endpoint.

## GET `/healthcheck/always-fail`

Always fails with HTTP 418 (teapot). Used for testing error handling.

## POST `/system/transactions/wait` (beta)

> Beta — may change without notice.

Wait until a blockchain transaction has been processed by Ethos event processors or until timeout elapses.
