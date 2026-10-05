# Ticket 008 - DNS Resolution Failure

**User:** David Johnson (`djohnson`)  
**Computer:** `CLIENT01`

## Issue
User could not reliably access domain resources by hostname.

## Troubleshooting
- Verified direct IP connectivity to `DC01`.
- Ran `ipconfig /all`.
- Tested name resolution with `nslookup`.
- Identified that `CLIENT01` was using `10.10.10.99` instead of the domain DNS server.

## Root Cause
Incorrect DNS server configuration on the workstation.

## Resolution
Restored the preferred DNS server to `10.10.10.10` and flushed the local resolver cache.

```cmd
ipconfig /flushdns
```

## Verification
Confirmed `company.local` resolved successfully and domain resources became accessible again.

**Status:** Resolved
