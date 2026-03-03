# Human Verification — Request

Base: `https://api.ethos.network/api/v2/human-verification`

## POST `/human-verification/request` 🔒

Request human verification.

```json
{ "profileId": 123, "verificationMethod": "IRL", "comment": "..." }
```

> For bond signature creation, see `docs/signatures/query.md` → `POST /signatures/humanity-bond`
