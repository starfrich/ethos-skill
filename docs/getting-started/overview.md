# Ethos Network API — Overview

Ethos is a blockchain-based reputation platform. Users build on-chain credibility through vouches, reviews, and human verification.

Base URL: `https://api.ethos.network/api/v2`

## Required Header

All requests (public and authenticated) must include:

```http
X-Ethos-Client: your-app-name@1.0.0
```

Requests without this header may be rate-limited.

## Authentication

Endpoints marked 🔒 require a Bearer token:

```http
Authorization: Bearer <privy_token>
```

Token is stored in `privy-token` cookie under `app.ethos.network`. Expires after 1 hour.

## Userkeys

Universal user identifiers accepted across all APIs:

```
profileId:10
address:0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045
service:discord:797130033613242441
service:farcaster:1112412
service:telegram:167380455
service:x.com:295218901
service:x.com:username:VitalikButerin
```

## Activity Types

```
attestation | broker-post | human-verification | invitation-accepted |
market | market-vote | reply | review | slash | unvouch | vote | vouch | xp-tip
```

## User Status

`ACTIVE | INACTIVE | MERGED`

## Pagination

All paginated responses return:

```json
{ "values": [], "total": 0, "limit": 50, "offset": 0 }
```

## Error Schema

```json
{ "message": "string", "code": "string", "issues": [{ "message": "string" }] }
```

| HTTP | Code                  |
| ---- | --------------------- |
| 400  | BAD_REQUEST           |
| 401  | UNAUTHORIZED          |
| 403  | FORBIDDEN             |
| 404  | NOT_FOUND             |
| 500  | INTERNAL_SERVER_ERROR |

## User Object (shared schema)

```json
{
  "id": 0,
  "profileId": 0,
  "displayName": "string",
  "username": "string",
  "avatarUrl": "uri",
  "description": "string",
  "score": 0,
  "status": "ACTIVE|INACTIVE|MERGED",
  "userkeys": ["string"],
  "xpTotal": 0,
  "xpStreakDays": 0,
  "xpRemovedDueToAbuse": false,
  "influenceFactor": 0,
  "influenceFactorPercentile": 0,
  "humanVerificationStatus": "REQUESTED|VERIFIED|REVOKED|null",
  "validatorNftCount": 0,
  "links": { "profile": "uri", "scoreBreakdown": "uri" },
  "stats": {
    "review": { "received": { "negative": 0, "neutral": 0, "positive": 0 } },
    "vouch": {
      "given": { "amountWeiTotal": 0, "count": 0 },
      "received": { "amountWeiTotal": 0, "count": 0 }
    }
  }
}
```
