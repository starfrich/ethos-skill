# Slash — Admin

Base: `https://api.ethos.network/api/v2/slash`

## Concepts

- Slash = penalty mechanism for trust violations
- Reduces target's score
- Also impacts all of target's vouchers (`penaltyAmount` per voucher)
- Activity type: `slash`

---

## GET `/slash/admin/list` 🔒 (admin)

List all slashes with admin-level details.
