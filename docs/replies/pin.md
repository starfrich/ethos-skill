# Replies — Pin

Base: `https://api.ethos.network/api/v2/replies`

## PUT `/replies/{replyId}/pin` 🔒

Pin or unpin a reply.

- Only available to the slasher or defender on slash activities
- Pinning auto-unpins any previously pinned replies

```json
{ "pinned": true }
```

Response:

```json
{ "ok": true, "unpinnedReplies": [1, 2] }
```
