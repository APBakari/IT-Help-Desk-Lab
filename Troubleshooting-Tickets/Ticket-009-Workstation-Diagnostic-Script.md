# Ticket 009 - Workstation Diagnostic Script

**Computer:** `CLIENT01`

## Requirement
Create a repeatable method for collecting common workstation information used during IT troubleshooting.

## Implementation
Created a PowerShell script that collects:

- Computer name
- Logged-in user
- Windows version/build
- IPv4 configuration
- DNS settings
- Network-adapter status
- Disk space
- Installed RAM
- Domain membership

The script saves timestamped diagnostic reports.

## Verification
Successfully ran the script on `CLIENT01` and generated a text report.

**Status:** Completed
