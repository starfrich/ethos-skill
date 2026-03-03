# Broker — Posts

Base: `https://api.ethos.network/api/v2/broker`

Broker posts = content monetization within the Ethos ecosystem.

---

## GET `/broker/posts`

List broker posts with filtering and pagination.

## GET `/broker/posts/me` 🔒

Current user's broker posts.

## GET `/broker/posts/{id}`

Get a specific broker post by ID.

## GET `/broker/posts/tx/{txHash}`

Get broker post by transaction hash.

## GET `/broker/posts/by-author/{userkey}`

Posts by a specific author.

## PUT `/broker/posts/{id}` 🔒

Update broker post status/archive fields (author only).

## PUT `/broker/posts/{id}/archive` 🔒

Archive a broker post.

## POST `/broker/posts/{id}/report` 🔒

Report a broker post for inappropriate content.

## GET `/broker/posts/{id}/ai-image/preview`

Preview AI image for broker post.
