# Broker — Posts

Base: `https://api.ethos.network/api/v2/broker`

Broker posts = content monetization within the Ethos ecosystem.

---

## GET `/broker/posts`

List broker posts with filtering and pagination.

## GET `/broker/me/posts` 🔒

Current user's broker posts.

## GET `/broker/posts/{id}`

Get a specific broker post by ID.

## GET `/broker/posts/tx/{txHash}`

Get broker post by transaction hash.

## GET `/broker/author/{profileId}/posts`

Posts by a specific author (by profileId).

## PUT `/broker/posts/{id}/status` 🔒

Update broker post status/archive fields (author only).

## PUT `/broker/posts/{id}/archive` 🔒

Archive a broker post.

## POST `/broker/posts/{id}/report` 🔒

Report a broker post for inappropriate content.

## POST `/broker/preview-premium-image` 🔒

Preview AI-generated premium image for a broker post.

## GET `/broker/author/{profileId}/completed-summary`

Completed posts summary for a user. Optional: `transactedUsersLimit`.

## GET `/broker/posts/{postId}/watch` 🔒

Get watch status for a broker post.

## POST `/broker/posts/{postId}/watch` 🔒

Watch a broker post.

## DELETE `/broker/posts/{postId}/watch` 🔒

Unwatch a broker post.
