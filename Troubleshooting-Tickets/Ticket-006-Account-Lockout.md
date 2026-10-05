# Ticket 006 - Active Directory Account Lockout

**User:** Lockout Test (`locktest`)

## Issue
User could not sign in even with the correct password.

## Troubleshooting
- Verified the domain account.
- Checked Active Directory for account status.
- Confirmed the account was locked after repeated failed authentication attempts.

## Root Cause
The account reached the configured domain lockout threshold.

## Resolution
Unlocked the account from Active Directory/PowerShell.

Useful commands:

```powershell
Search-ADAccount -LockedOut
Unlock-ADAccount -Identity locktest
```

## Verification
The user successfully authenticated to `CLIENT01` after the unlock.

**Status:** Resolved
