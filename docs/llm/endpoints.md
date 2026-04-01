# LLM — Endpoints

Base: `https://api.ethos.network/api/v2`

## POST `/llm/translate`

Get LLM translation for content. Required: `activityType`, `activityId`, `desiredLanguage`.

## POST `/llm/quality` 🔒

Check content quality. Required: `title`. Optional: `description`. Returns `score` (0–100).

## GET `/llm/activity-summary`

Get cached activity summary for a user. Required: `userkey`. Returns `activityCount`, `generatedAt`, `summary`.

## POST `/llm/activity-summary` 🔒

Generate or regenerate activity summary for a user. Required body: `userkey`.

## POST `/llm/tags` 🔒

Generate topic tags for an activity. Required: `activityType`, `activityId`. Returns `tags` array (0–5 items).
