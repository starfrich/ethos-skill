# Ethos Skill

A Claude Code skill for the [Ethos Network](https://ethos.network) API a blockchain-based reputation platform.

## Installation

**One-liner:**

```bash
curl -fsSL https://raw.githubusercontent.com/starfrich/ethos-skill/master/install.sh | sh
```

**Or clone manually:**

```bash
git clone https://github.com/starfrich/ethos-skill ~/.claude/skills/ethos-network
```

## What it does

Gives Claude deep, on-demand knowledge of the Ethos API without loading everything at once. Docs are split by domain and loaded only when relevant, keeping token usage low.

Use `/ethos-skill` anywhere in your message to trigger the skill:

- _"Can you check how score lookup works for a wallet address in /ethos-skill?"_
- _"For the next step, let's rely on /ethos-skill to validate the wallet before creating the review."_
- _"Instead of hardcoding this, pull the score directly from /ethos-skill."_
- _"Compare vouch and review objects in /ethos-skill."_

## Structure

```
ethos-skill/
├── SKILL.md                    # Skill entry point — Claude reads this first
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

## API reference

- Docs: https://developers.ethos.network
- OpenAPI spec: https://api.ethos.network/docs/openapi.json
- Base URL: `https://api.ethos.network/api/v2`
