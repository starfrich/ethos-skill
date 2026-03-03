# Notifications — Feed

Base: `https://api.ethos.network/api/v2/notifications`

All endpoints require Bearer token 🔒.

## Notification Types

```
SIMPLE | VOUCH | VOUCH_INCREASED | UNVOUCH | REVIEW | INVITATION_ACCEPTED |
REPLY | SLASH_CREATE | SLASH_COMPLETE | SLASH_COMPLETE_SUBSCRIBED |
SLASH_SUPPORTER_PENALTY | SLASH_SUPPORTER_AT_RISK | CONTRIBUTION_STREAK_ENDING |
BROKER_POST_EXPIRING | BROKER_POST_EXPIRED | XP_TIP | HUMAN_VERIFIED |
HUMAN_VERIFICATION_RECEIVED | HUMAN_VERIFICATION_NUDGE | CHITS_GRANTED
```

---

## GET `/notifications/me` 🔒

Pending notifications for the authenticated user.

| Param    | Type    | Required |
| -------- | ------- | -------- |
| `limit`  | integer | no       |
| `offset` | number  | no       |

## GET `/notifications/stats/me` 🔒

Notification stats.

```json
{ "unreadCount": 0 }
```

## POST `/notifications/me/mark-as-read` 🔒

Mark notifications as read.

```json
{ "read": 0 }
```
