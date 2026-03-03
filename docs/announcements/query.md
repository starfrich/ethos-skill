# Announcements — Query

Base: `https://api.ethos.network/api/v2`

## GET `/announcements/active`

Public. Returns active announcements.

Fields: `id`, `title`, `description`, `imageUrl`, `actionButtonLabel`, `actionButtonUrl`, `startDateTime`, `endDateTime`, `status`, `authorAvatarUrl`

## POST `/announcements/{id}/viewed` 🔒

Mark announcement as viewed.

```json
{ "ok": true }
```
