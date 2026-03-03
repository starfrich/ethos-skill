# ethos-network

A Claude Code skill for the [Ethos Network](https://ethos.network) API a blockchain-based reputation platform.

## What it does

Gives Claude deep, on-demand knowledge of the Ethos API without loading everything at once. Docs are split by domain and loaded only when relevant, keeping token usage low.

## Usage

Ask Claude anything about the Ethos API:

- _"How do I get the credibility score for a wallet address?"_
- _"What endpoints are available for XP tips?"_
- _"Show me the response schema for vouch queries"_
- _"How do I post a review via the Ethos Everywhere Wallet?"_

## Structure

```
ethos-network/
├── SKILL.md                    # Skill entry point — Claude reads this first
├── generate-responses.mjs      # Script to regenerate response.toon files
├── openapi-full.json           # Cached OpenAPI spec (source for response schemas)
└── docs/
    ├── getting-started/
    │   ├── overview.md         # Auth, userkeys, base URL, shared schemas
    │   └── integration.md      # Ethos Everywhere Wallet, Login with Ethos, Quickstart
    └── <domain>/
        ├── *.md                # Endpoint reference (always available)
        └── response.toon       # Response schemas in TOON format (on-demand)
```

### Domains covered

| Domain               | Endpoints                                         |
| -------------------- | ------------------------------------------------- |
| `activities`         | feed, profile, lookup by id/tx/userkey            |
| `ai-images`          | job management (admin)                            |
| `announcements`      | active announcements                              |
| `apps`               | apps CRUD                                         |
| `auctions`           | active, by id, list                               |
| `benefits`           | limited-time, score-based, admin CRUD             |
| `broker`             | posts CRUD, report, AI image preview              |
| `categories`         | categories CRUD, users, requests                  |
| `chains`             | chains CRUD (admin), gas price                    |
| `contributions`      | history, dailies, forgive                         |
| `endorsements`       | endorsers by target/viewer                        |
| `ens`                | lookup by address or name                         |
| `exchange-rates`     | ETH price in USD                                  |
| `feature-views`      | check and mark feature views                      |
| `human-verification` | verifications, bonds, signature                   |
| `internal`           | internal endpoints (unstable)                     |
| `invitations`        | list, check, pending, tree                        |
| `llm`                | translate, quality check                          |
| `markets`            | list, simulate, holders, price history            |
| `notifications`      | feed, stats, settings                             |
| `nfts`               | ownership, user NFTs, validator listings          |
| `profiles`           | list, recent, stats                               |
| `project-votes`      | cast, balance, voters, chart                      |
| `projects`           | list, details, team, chains                       |
| `replies`            | fetch, pin                                        |
| `reviews`            | count/latest between users                        |
| `score`              | by address/userId/userkey (single & bulk), status |
| `signatures`         | register address                                  |
| `slash`              | admin list, supporter penalties                   |
| `stats`              | score distribution                                |
| `system`             | healthcheck, wait for transaction                 |
| `users`              | bulk & single lookup, search, refresh             |
| `votes`              | get votes, stats (single & bulk)                  |
| `vouches`            | query, mutual, fees                               |
| `wallets`            | auth, Ethos Everywhere Wallet actions             |
| `xp`                 | user XP, seasons, tips, dashboard, validators     |

## Response schemas

Each domain includes a `response.toon` file with response schemas in [TOON](https://toonformat.dev) format (~40% fewer tokens than JSON). Claude loads these only when you ask about response shapes, TypeScript types, or need to debug a response.

## Regenerating response schemas

When the Ethos API is updated, refresh the response schemas:

```bash
# 1. Fetch the latest OpenAPI spec
curl -s "https://api.ethos.network/docs/openapi.json" -o openapi-full.json

# 2. Regenerate all response.toon files
node generate-responses.mjs
```

Requires Node.js 18+.

## API reference

- Docs: https://developers.ethos.network
- OpenAPI spec: https://api.ethos.network/docs/openapi.json
- Base URL: `https://api.ethos.network/api/v2`
