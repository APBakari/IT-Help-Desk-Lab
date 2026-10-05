# Ticket 004 - Shared Folder Access

**User:** John Smith (`jsmith`)  
**Department:** Sales

## Issue
User reported being unable to access the Accounting shared folder.

## Troubleshooting
- Verified connectivity to `DC01`.
- Confirmed domain authentication.
- Reviewed the user's Active Directory group memberships.
- Reviewed share and NTFS permissions.

## Root Cause
The user belonged to `Sales-Users` and was not authorized through `Accounting-Users`.

## Resolution
Confirmed the access denial was working as designed. No permissions were changed without authorization.

## Verification
An authorized Accounting user successfully accessed the same share.

**Status:** Resolved
