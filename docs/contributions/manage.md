# Contributions — Manage

Base: `https://api.ethos.network/api/v2/contributions`

Daily contribution tracking for streak-based XP rewards.

---

## GET `/contributions/history`

Get contribution history for the authenticated user.

## GET `/contributions/dailies`

Get daily contribution tasks.

## GET `/contributions/latest-missed-day`

Get the latest missed contribution day.

## POST `/contributions/forgive-self` 🔒

Self-forgive a missed contribution day.

## POST `/contributions/{userkey}/forgive` 🔒 (admin)

Forgive a missed day for any user.
