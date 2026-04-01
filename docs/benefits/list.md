# Benefits — List

Base: `https://api.ethos.network/api/v2/benefits`

---

## GET `/benefits/limited-time`

List limited-time benefits with pagination and filtering.

## GET `/benefits/score-based`

List score-based benefits.

## GET `/benefits/categories`

Get benefit categories.

---

## Admin Endpoints 🔒

### GET `/benefits/admin/all`

Admin view of all benefits.

### POST `/benefits/categories`

Create benefit category.

### PUT `/benefits/categories/{id}`

Update benefit category.

### DELETE `/benefits/categories/{id}`

Delete benefit category.

### POST `/benefits`

Create benefit.

### PUT `/benefits/{benefitId}`

Update benefit.

### DELETE `/benefits/{benefitId}`

Delete benefit.

### GET `/benefits/{benefitId}/codes/info`

Get code availability info: `hasAccessCodes`, `totalCodes`, `claimedCodes`, `availableCodes`, `userClaimedCode`.

### POST `/benefits/{benefitId}/codes/claim` 🔒

Claim an exclusive access code for the current user.

### POST `/benefits/{benefitId}/codes` 🔒

Add exclusive access codes to a benefit.

### DELETE `/benefits/{benefitId}/codes/unclaimed` 🔒

Delete all unclaimed codes for a benefit.
