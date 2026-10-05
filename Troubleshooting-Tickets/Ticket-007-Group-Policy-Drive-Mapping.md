# Ticket 007 - Group Policy Drive Mapping

**User:** David Johnson (`djohnson`)  
**Department:** Accounting

## Requirement
Accounting users required consistent access to the department shared drive.

## Implementation
Created and linked an `Accounting Drive Mapping` GPO to the Accounting OU and configured Group Policy Preferences to map:

```text
A: -> \\DC01\Accounting
```

## Verification
Confirmed the mapping with:

```cmd
net use
gpresult /r
```

File Explorer also showed the Accounting `A:` drive.

**Status:** Completed
