# Apps — API

Base: `https://api.ethos.network/api/v2/apps`

App types: `APP | INTEGRATION | AGENT`
Statuses: `ACTIVE | INACTIVE`

---

## GET `/apps`

List apps.

| Param | Type | Required |
|-------|------|----------|
| `appType` | enum | no |
| `status` | enum | no |
| `limit` | integer | no |
| `offset` | number | no |

## POST `/apps` 🔒

Create an app.

| Field | Type | Required |
|-------|------|----------|
| `name` | string | yes (max 100) |
| `appType` | enum | yes |
| `authorUserId` | integer | yes |
| `link` | URI | yes |
| `description` | string | yes (max 1000) |

## GET `/apps/{id}`

Get app by ID. Includes full `author` object.

## GET `/apps/by-type/{appType}`

Filter apps by type. Returns array.

## PUT `/apps/{appId}` 🔒

Update app. All fields optional.

## DELETE `/apps/{appId}` 🔒

Delete an app.
