# Categories — Manage

Base: `https://api.ethos.network/api/v2/categories`

---

## GET `/categories`

List all categories.

## POST `/categories` 🔒

Create a category.

## GET `/categories/{id}`

Get category by ID.

## GET `/categories/summaries/bulk`

Bulk fetch category summaries.

## PUT `/categories/{categoryId}` 🔒

Update a category.

## DELETE `/categories/{categoryId}` 🔒

Delete a category.

---

## Category Users

### GET `/categories/{categoryId}/users`

List users in a category.

### POST `/categories/{categoryId}/users` 🔒

Add user to category.

### DELETE `/categories/{categoryId}/users` 🔒

Remove user from category.

### POST `/categories/{categoryId}/bulk-import` 🔒

Bulk import users into category.

---

## Category Requests

### GET `/categories/requests`

List category requests.

### PUT `/categories/requests/{requestId}/status` 🔒

Update category request status.
