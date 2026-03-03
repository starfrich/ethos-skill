# Ethos Skill

A Claude Code skill for the [Ethos Network](https://ethos.network) API a blockchain-based reputation platform.

## Installation

**One-liner:**

```bash
curl -fsSL https://gist.githubusercontent.com/starfrich/635092c17508562bea75ced5b2bb54ab/raw/install.sh | sh
```

**Or clone manually:**

```bash
git clone https://github.com/starfrich/ethos-skill ~/.claude/skills/ethos-skill
```

Then allow Claude to read the skill docs without prompting, add this to your `~/.claude/settings.json`:

```json
{
  "permissions": {
    "allow": ["Read(~/.claude/skills/ethos-skill/**)"]
  }
}
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

<details>
    
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

</details>

## Benchmark

Comparing token usage between loading `llms-full.txt` directly (~330k tokens) vs this skill (on-demand per domain).

| #       | Question                                                      | llms-full.txt tokens | ethos-skill tokens | Tokens saved |
| ------- | ------------------------------------------------------------- | -------------------- | ------------------ | ------------ |
| 1       | How do I get a credibility score by wallet address?           | +11k                 | +3k                | 73%          |
| 2       | What endpoints are available for XP tips?                     | +9k                  | +2k                | 78%          |
| 3       | Show me the response schema for vouch queries                 | +8k                  | +6k                | 25%          |
| 4       | How do I post a review via Ethos Everywhere Wallet?           | +24k                 | +3k                | 88%          |
| 5       | How do I look up a user by their Twitter username?            | +11k                 | +3k                | 73%          |
| 6       | What notification types exist and how do I mark them as read? | +16k                 | +2k                | 88%          |
| 7       | How does the slash mechanism affect vouchers?                 | +12k                 | +3k                | 75%          |
| 8       | What is the time scope system for project votes?              | +7k                  | +2k                | 71%          |
| **avg** |                                                               | **+12.25k**          | **+3k**            | **~75%**     |

> Tokens counted from Claude Code `/context` after each query.

## Response schemas

Each domain includes a `response.toon` file with response schemas in [TOON](https://toonformat.dev) format (~40% fewer tokens than JSON). Claude loads these only when you ask about response shapes, TypeScript types, or need to debug a response.

## API reference

- Docs: https://developers.ethos.network
- OpenAPI spec: https://api.ethos.network/docs/openapi.json
- Base URL: `https://api.ethos.network/api/v2`
