# Projects — Manage

Base: `https://api.ethos.network/api/v2/projects`

## PUT `/projects/{projectId}` 🔒 (admin or project owner)

Update an existing project.

## POST `/projects/{projectId}/team` 🔒 (admin or project owner)

Add team members to a project.

## DELETE `/projects/{projectId}/team` 🔒 (admin or project owner)

Remove a team member from a project.

## POST `/projects/{projectId}/chains` 🔒 (admin or project owner)

Add a chain to a project.

## DELETE `/projects/{projectId}/chains/{chainId}` 🔒 (admin or project owner)

Remove a chain from a project.

## GET `/projects/confirm` 🔒 (admin)

Confirm project creation using a token.
