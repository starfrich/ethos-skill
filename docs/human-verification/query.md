# Human Verification — Query

Base: `https://api.ethos.network/api/v2/human-verification`

## Status Values

`REQUESTED | VERIFIED | REVOKED`

Verified status significantly increases credibility score.
Field on user object: `humanVerificationStatus`

---

## GET `/human-verification/search`

Search human verifications with filters.

## GET `/human-verification/my-verifications` 🔒

Verifications created by the current user.

## GET `/human-verification/verifications`

Get all human verifications.

## GET `/human-verification/verifications/balance`

Balance info for human verification bonds.

## GET `/human-verification/{profileId}`

Human verification info for a specific profile.

## GET `/human-verification/verifiers`

Search eligible human verifiers.
