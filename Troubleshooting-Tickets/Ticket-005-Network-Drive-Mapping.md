# Ticket 005 - Network Drive Mapping

**User:** David Johnson (`djohnson`)  
**Department:** Accounting

## Issue
User required convenient access to the Accounting department share.

## Troubleshooting
- Verified connectivity to `DC01`.
- Confirmed domain authentication.
- Verified membership in `Accounting-Users`.
- Confirmed access to `\\DC01\Accounting`.

## Resolution
Mapped `\\DC01\Accounting` to drive `A:`.

## Verification
Confirmed the mapped drive appeared in File Explorer and with:

```cmd
net use
```

**Status:** Resolved
