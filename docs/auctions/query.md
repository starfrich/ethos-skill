# Auctions — Query

Base: `https://api.ethos.network/api/v2/auctions`

## GET `/auctions/active`

Get currently active auctions.

## GET `/auctions/{auctionId}`

Get a specific auction by ID.

## GET `/auctions`

List all auctions with pagination.

| Param            | Type    | Required | Notes                                                                                               |
| ---------------- | ------- | -------- | --------------------------------------------------------------------------------------------------- |
| `status`         | enum    | no       | `DISABLED`, `ENABLED`, `SOLD`                                                                       |
| `nftContract`    | string  | no       |                                                                                                     |
| `nftTokenId`     | integer | no       |                                                                                                     |
| `orderBy`        | enum    | no       | `id`, `createdAt`, `startTime`, `startPrice`, `pricePaid`, `soldTime`, `nftTokenId` (default: `id`) |
| `orderDirection` | enum    | no       | `asc` or `desc` (default: `desc`)                                                                   |
| `limit`          | integer | no       | max 50, default 50                                                                                  |
| `offset`         | number  | no       | default 0                                                                                           |
