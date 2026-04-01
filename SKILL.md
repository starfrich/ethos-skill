---
name: ethos-skill
description: Deep knowledge of Ethos Network — a blockchain-based reputation platform. Use when the user asks about Ethos Network API, SDK integration, vouch/review/score mechanics, userkeys, or building apps on Ethos. Trigger phrases include "ethos network", "ethos API", "ethos score", "vouch", "ethos review", "ethos market", "ethos XP", or any question about the Ethos reputation system.
---

# Ethos Network

Ethos Network is a blockchain-based reputation platform. Users build on-chain credibility through vouches, reviews, and human verification.

Base URL: `https://api.ethos.network/api/v2`

## Reference Docs

Read the relevant file(s) from `docs/` based on the question context:

### Getting Started

- `docs/getting-started/overview.md` — base URL, auth, required headers, userkeys, activity types, error schema, user object schema
- `docs/getting-started/integration.md` — Ethos Everywhere Wallet partner guide, Log in with Ethos, Vibe Coding Quickstart

### Core APIs

- `docs/score/lookup.md` — all `/score` endpoints (by address, userId, userkey — single & bulk, updates, status, history)
- `docs/score/concepts.md` — score levels, credibility mechanics, slash supporter penalties
- `docs/users/lookup.md` — all `/users` and `/user` bulk & single lookup endpoints
- `docs/users/search.md` — user search, categories, refresh endpoints
- `docs/vouches/query.md` — vouch query, mutual vouchers, fees, vouch mechanics
- `docs/reviews/query.md` — review query (count, latest between), review mechanics

### Activities

- `docs/activities/lookup.md` — fetch by id, bulk, tx hash, by userkey
- `docs/activities/feed.md` — feed and notifications feed
- `docs/activities/profile.md` — profile given/received/all, project activities, slash impacted supporters

### XP

- `docs/xp/user.md` — total XP, season XP, timeline, leaderboard rank
- `docs/xp/seasons.md` — seasons list, weeks per season
- `docs/xp/tips.md` — send tip, sent/received tips, stats, send-details
- `docs/xp/decision.md` — XP history, decision get/post/metadata
- `docs/xp/validators.md` — validator list, validator profile
- `docs/xp/dashboard.md` — yield, periodic-rewards, multipliers, daily-earnings, daily-awards, weekly-delegator

### Markets

- `docs/markets/query.md` — list, featured, profile market, holders, price history, change, bulk info, configs
- `docs/markets/simulate.md` — simulate-buy, market user lookups

### Social

- `docs/notifications/feed.md` — notification feed, stats, mark-as-read, notification types enum
- `docs/notifications/settings.md` — notification settings get/update
- `docs/replies/query.md` — reply schema, fetch by id, fetch by parent, deep-link-info, offset
- `docs/replies/pin.md` — pin/unpin reply
- `docs/slash/admin.md` — slash concepts, supporter penalties, admin list

### Platform

- `docs/invitations/query.md` — invitations list, check, pending, accepted tree
- `docs/wallets/auth.md` — exchange token, logout, auth-check, funds-check
- `docs/wallets/actions.md` — reviews, vote, reply, invitations, bonds via Ethos Everywhere Wallet
- `docs/human-verification/query.md` — search verifications, balance, profile info, verifiers
- `docs/human-verification/bonds.md` — request verification
- `docs/contributions/manage.md` — contribution history, dailies, forgive endpoints
- `docs/chains/manage.md` — chains list/CRUD (admin), Base gas price
- `docs/endorsements/query.md` — get endorsers of a target user known by viewer
- `docs/ens/query.md` — ENS lookup by address or name
- `docs/exchange-rates/query.md` — ETH price in USD
- `docs/feature-views/manage.md` — check and mark feature views per user
- `docs/internal/endpoints.md` — internal endpoints (unstable, not recommended)
- `docs/llm/endpoints.md` — LLM translate, quality check, activity summary, tags
- `docs/nfts/query.md` — NFT ownership check, user NFTs, validator listings
- `docs/profiles/query.md` — paginated profiles list, recent profiles, stats
- `docs/projects/query.md` — list, suggested, by id, by username, team members
- `docs/projects/manage.md` — update project, team/chains CRUD (admin or owner)
- `docs/project-votes/votes.md` — cast votes, balance, voters, bulk-totals, chart (with time scope system)
- `docs/signatures/query.md` — signature for registering an address, humanity bond, self-declared humanity bond
- `docs/stats/query.md` — score distribution, human verification statistics
- `docs/system/healthcheck.md` — healthcheck endpoints, wait for transaction
- `docs/votes/query.md` — get votes, single/bulk vote stats for activities
- `docs/apps/apps.md` — apps CRUD endpoints
- `docs/announcements/query.md` — active announcements, mark as viewed
- `docs/ai-images/manage.md` — AI image jobs (admin): list, by entity, regenerate, activate, retry
- `docs/broker/posts.md` — broker posts CRUD, report, AI image preview, watch, completed-summary
- `docs/api-keys/manage.md` — API key create, list, revoke
- `docs/auctions/query.md` — active, by id, list auctions
- `docs/categories/manage.md` — categories CRUD, category users, requests
- `docs/benefits/list.md` — limited-time benefits, score-based benefits, admin CRUD

If the question spans multiple topics, read all relevant files before answering.

## Response Schemas (on-demand)

Each domain has a `response.toon` file with full response schemas in TOON format.
Only read these when the user explicitly asks about response shape, needs to write types/interfaces, or is debugging a response.

Pattern: `docs/<domain>/response.toon`

Examples:

- `docs/score/response.toon` — score endpoint response schemas
- `docs/xp/response.toon` — all XP endpoint response schemas
- `docs/users/response.toon` — user lookup response schemas

Never load `response.toon` unless response schema detail is needed.
