# Users — Lookup

Base: `https://api.ethos.network/api/v2`

All endpoints return the User Object. See `getting-started/overview.md` for full schema.

---

## Bulk Lookup (POST) — up to 500 items each

### POST `/users/by/ids`

```json
{ "userIds": [1, 2, 3] }
```

### POST `/users/by/address`

```json
{ "addresses": ["0x..."] }
```

### POST `/users/by/profile-id`

```json
{ "profileIds": [10, 20] }
```

### POST `/users/by/x`

```json
{ "accountIdsOrUsernames": ["295218901", "VitalikButerin"] }
```

### POST `/users/by/discord`

```json
{ "discordIds": ["797130033613242441"] }
```

### POST `/users/by/farcaster`

```json
{ "farcasterIds": ["1112412"] }
```

### POST `/users/by/telegram`

```json
{ "telegramIds": ["167380455"] }
```

### POST `/users/by/farcaster/usernames`

Results split into three arrays:

- `users` — matched (safe to cache)
- `notFoundUsernames` — valid but no Ethos user (safe to cache)
- `errorUsernames` — failed due to network errors

```json
{ "farcasterUsernames": ["string"] }
```

---

## Single Lookup (GET)

### GET `/user/{userId}`

### GET `/user/by/address/{address}`

### GET `/user/by/ethos-everywhere-wallet/{address}`

### GET `/user/by/profile-id/{profileId}`

### GET `/user/by/username/{username}`

### GET `/user/by/x/{accountIdOrUsername}`

### GET `/user/by/discord/{discordUserId}`

### GET `/user/by/farcaster/{farcasterUserId}`

### GET `/user/by/farcaster/username/{farcasterUsername}`

### GET `/user/by/telegram/{telegramUserId}`
