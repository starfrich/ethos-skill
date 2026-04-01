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

| Domain               | Endpoints                                                                                                                               |
| -------------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| `activities`         | feed, profile (given/received/all/project), lookup by id/tx/userkey, slash impacted supporters                                          |
| `ai-images`          | list, get, by-entity, selected, regenerate, activate, retry (admin)                                                                     |
| `announcements`      | active announcements, mark as viewed                                                                                                    |
| `api-keys`           | create, list, revoke                                                                                                                    |
| `apps`               | list, get, get by type, create, update, delete                                                                                          |
| `auctions`           | active, by id, list with filters                                                                                                        |
| `benefits`           | limited-time, score-based, all (admin), categories CRUD, benefit CRUD, codes (info/claim/add/delete unclaimed)                          |
| `broker`             | list, get, by tx hash, by author, update status, archive, report, AI image preview, watch, completed-summary                            |
| `categories`         | categories CRUD, users, bulk import, requests                                                                                           |
| `chains`             | list, add, edit, delete (admin), gas price                                                                                              |
| `contributions`      | history, dailies, latest missed day, forgive self, forgive any user (admin)                                                             |
| `endorsements`       | endorsers by target and viewer                                                                                                          |
| `ens`                | lookup by address or ENS name                                                                                                           |
| `exchange-rates`     | ETH price in USD                                                                                                                        |
| `feature-views`      | check viewed, mark as viewed                                                                                                            |
| `human-verification` | search, my verifications, all verifications, balance, by profile, verifiers, request                                                    |
| `internal`           | users, listings, trending (unstable)                                                                                                    |
| `invitations`        | list, check, pending, tree                                                                                                              |
| `llm`                | translate, quality check, activity summary, tags                                                                                        |
| `markets`            | list, featured, info, holders, price history, change, bulk info, simulate buy, user lookups, configs                                    |
| `notifications`      | pending feed, stats, mark as read, settings                                                                                             |
| `nfts`               | owns validator, user NFTs, track collection (admin), validator listings                                                                 |
| `profiles`           | list, recent, stats                                                                                                                     |
| `project-votes`      | cast vote, balance, voters, reallocate (admin), bulk totals, chart                                                                      |
| `projects`           | list, suggested, get, details, details by username, team, chains, confirm creation                                                      |
| `replies`            | by id, by parent, deep-link-info, offset, pin                                                                                           |
| `reviews`            | count between users, latest between users                                                                                               |
| `score`              | by address/userId/userkey (single and bulk), updates, status, history                                                                   |
| `signatures`         | register address, humanity bond, self-declared humanity bond                                                                            |
| `slash`              | supporter penalties, admin list                                                                                                         |
| `stats`              | score distribution, human verification statistics                                                                                       |
| `system`             | healthcheck (public/auth/always-fail), wait for transaction                                                                             |
| `users`              | bulk lookup (ids/address/profile/twitter/discord/farcaster/telegram), single lookup, search, categories, refresh                        |
| `votes`              | get votes, stats (single and bulk)                                                                                                      |
| `vouches`            | query, mutual vouchers, fees                                                                                                            |
| `wallets`            | auth exchange/logout, auth check, funds check, review actions (create/edit/archive), vote, reply, invitations, bonds (create/archive)   |
| `xp`                 | user XP (total/season/weekly/timeline), leaderboard rank, seasons, weeks, tips, send details, decision, metadata, validators, dashboard |

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

## Changelog

<details>

### 2026-04-01

Synced to OpenAPI v226 (215 → 226 paths).

**New domain**

- `api-keys`: create, list, revoke API keys

**New endpoints**

- `broker`: `GET /broker/author/{profileId}/completed-summary`, watch/unwatch/get-watch-status
- `llm`: `GET/POST /llm/activity-summary`, `POST /llm/tags`
- `replies`: `GET /replies/{replyId}/deep-link-info`, `GET /replies/{replyId}/offset`
- `score`: `GET /score/history`
- `signatures`: `POST /signatures/self-declared-humanity-bond`
- `stats`: `GET /stats/human-verification`

**Fixes**

- `wallets`: corrected archive paths (`/wallets/privy/archive/review` → `/wallets/activity/review/{id}/archive`, same for bond); corrected invitation paths (`/wallets/privy/invite` → `/wallets/privy/invite/address`, `/wallets/privy/cancel-invite` → `/wallets/privy/invite/cancel`); corrected bond path (`/wallets/privy/bond` → `/wallets/privy/bonds`)
- `broker`: corrected `GET /broker/posts/me` → `GET /broker/me/posts`; corrected `GET /broker/posts/by-author/{userkey}` → `GET /broker/author/{profileId}/posts`; corrected `PUT /broker/posts/{id}` → `PUT /broker/posts/{id}/status`; corrected AI image preview path
- `benefits`: added missing codes endpoints (`/codes/info`, `/codes/claim`, `/codes`, `/codes/unclaimed`)

---

### 2026-03-04

Full validation pass comparing `dev/<domain>.md` against `docs/` for all 36 domains.

**Fixes**

- `auctions`: added filter/sort parameter table to `GET /auctions`
- `benefits`: corrected path `GET /benefits` to `GET /benefits/limited-time`
- `human-verification`: corrected 3 wrong paths in `query.md` (`/verifications/me`, `/profile/{userkey}`, missing `getAllVerifications`); rewrote `bonds.md` which referenced non-existent endpoints
- `internal`: added missing URL paths to all 6 endpoints in `endpoints.md`
- `markets`: corrected path `GET /markets/{profileId}` to `GET /markets/{profileId}/info`
- `signatures`: added missing `POST /signatures/humanity-bond` to `query.md`
- `slash`: added missing `GET /slash/supporter-penalties/{profileId}` to `admin.md`
- `system`: corrected path `POST /system/transactions/wait` to `GET /transactions/{txHash}/processed`; added `tx-waitForProcessing` to `response.toon`
- `wallets`: corrected paths `POST /wallets/privy/exchange` and `POST /wallets/privy/logout` to `POST /auth/exchange` and `POST /auth/logout`; added missing `auth-exchange` and `auth-logout` to `response.toon`
- `xp`: added missing `GET /xp/user/{userkey}/season/{seasonId}/weekly` to `user.md`

---

### 2026-03-03

**Initial release**

- Published all 36 domain docs under `docs/` with endpoint references and `response.toon` schema files
- Added `SKILL.md` entry point with on-demand loading instructions per domain
- Added `README.md` with installation guide, structure overview, and benchmark results
- Added one-liner installation via hosted `install.sh`
- Added `settings.json` snippet for allowing Claude to read skill docs without prompting
- Benchmark: ~75% average token savings vs loading full API reference (~330k tokens)

</details>
