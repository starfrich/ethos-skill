# Human Verification — Query

Base: `https://api.ethos.network/api/v2/human-verification`

## Status Values

`REQUESTED | VERIFIED | REVOKED`

Verified status significantly increases credibility score.
Field on user object: `humanVerificationStatus`

---

## GET `/human-verification/verifications` (search)

Search human verifications with filters.

## GET `/human-verification/verifications/me` 🔒

Verifications created by the current user.

## GET `/human-verification/verifications/balance`

Balance info for human verification bonds.

## GET `/human-verification/profile/{userkey}`

Human verification info for a specific profile.

## GET `/human-verification/verifiers` (search)

Search eligible human verifiers.
