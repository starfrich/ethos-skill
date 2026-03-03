# Notifications — Settings

Base: `https://api.ethos.network/api/v2/notifications`

All endpoints require Bearer token 🔒.

## GET `/notifications/me/settings` 🔒

Per-type notification settings.

```json
{
  "REVIEW": { "listDisabled": false, "pushDisabled": false },
  "VOUCH": { "listDisabled": false, "pushDisabled": true }
}
```

## PUT `/notifications/me/settings` 🔒

Update notification settings.

Body: same shape as GET — map of notification type → `{ listDisabled, pushDisabled }`.
