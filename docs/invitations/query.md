# Invitations — Query

Base: `https://api.ethos.network/api/v2/invitations`

## GET `/invitations`

List invitations for the authenticated user.

## GET `/invitations/check`

Check if an address has a pending invitation.

## GET `/invitations/pending/{address}`

Get pending invitations for a specific address.

Path: `address` (Ethereum address)

## GET `/invitations/accepted/{senderProfileId}/tree`

Invitation tree for a sender — shows accepted invitation hierarchy.

Path: `senderProfileId` (integer)
