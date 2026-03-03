# Endorsements — Query

Base: `https://api.ethos.network/api/v2`

## GET `/endorsements/{targetUserkey}`

Get endorsers of a target user that the viewer knows.

| Param           | Type   | Required    |
| --------------- | ------ | ----------- |
| `targetUserkey` | string | yes (path)  |
| `viewerUserkey` | string | yes (query) |
