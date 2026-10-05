# IT Help Desk Home Lab

A hands-on Windows support lab built to practice common entry-level help desk and desktop support tasks in a small domain environment.

## Lab Overview

This project uses Oracle VirtualBox to simulate a small business Windows environment with a Windows Server domain controller and a Windows 11 client.

### Environment

| System | Role | IP Address | Operating System |
|---|---|---:|---|
| `DC01` | Domain Controller, DNS, Group Policy, File Server | `10.10.10.10` | Windows Server 2025 Standard Evaluation |
| `CLIENT01` | Domain-joined workstation | `10.10.10.20` | Windows 11 Enterprise Evaluation |

**Domain:** `company.local`  
**Virtual network:** `10.10.10.0/24`

```text
VirtualBox LabNet (10.10.10.0/24)
        |
        +-- DC01
        |   10.10.10.10
        |   Active Directory Domain Services
        |   DNS
        |   Group Policy
        |   SMB File Sharing
        |
        +-- CLIENT01
            10.10.10.20
            Windows 11 Enterprise
            Joined to company.local
```

## Skills Practiced

- Windows Server 2025 administration
- Active Directory Domain Services
- Organizational Units (OUs)
- User and security-group administration
- Windows 11 domain joining
- DNS configuration and troubleshooting
- Static IPv4 configuration
- SMB shared folders
- Share and NTFS permissions
- Group Policy Management
- Group Policy Preferences
- Automatic mapped-drive deployment
- Account-lockout troubleshooting
- PowerShell diagnostics and reporting
- Tier 1 help desk documentation

## Active Directory

Created the `company.local` domain and organized users into departmental OUs:

- IT
- Sales
- HR
- Accounting

Departmental security groups include:

- `IT-Users`
- `Sales-Users`
- `HR-Users`
- `Accounting-Users`

See [Active-Directory/README.md](Active-Directory/README.md).

![Active Directory users and OUs](Screenshots/active-directory-users.jpg)

## Domain-Joined Workstation

`CLIENT01` was configured with a static address of `10.10.10.20`, pointed to the domain controller at `10.10.10.10` for DNS, and joined to `company.local`.

A domain user was then able to sign in successfully to the workstation.

![Domain user signed in to CLIENT01](Screenshots/domain-user-login.jpg)

## Shared Folder Permissions

Created an Accounting department share at:

```text
\\DC01\Accounting
```

Access was restricted to the `Accounting-Users` security group using both share permissions and NTFS permissions.

A Sales user was correctly denied access, confirming that authorization was working as designed.

![Unauthorized user denied access](Screenshots/accounting-access-denied.jpg)

See [Shared-Folders/README.md](Shared-Folders/README.md).

## Group Policy Drive Mapping

Created and linked an `Accounting Drive Mapping` GPO to the Accounting OU. Group Policy Preferences automatically mapped:

```text
A: -> \\DC01\Accounting
```

for Accounting users.

Verification was performed with `net use`, `gpresult /r`, and File Explorer.

![Mapped Accounting drive](Screenshots/accounting-drive.jpg)

![Group Policy verification](Screenshots/gpresult-accounting-drive.jpg)

See [Group-Policy/README.md](Group-Policy/README.md).

## Account Lockout Troubleshooting

Configured a temporary lab account-lockout policy:

- Lockout threshold: 3 failed attempts
- Lockout duration: 15 minutes
- Observation window: 15 minutes

A dedicated test account was intentionally locked from `CLIENT01`, identified from `DC01`, unlocked, and successfully tested afterward.

Useful PowerShell commands included:

```powershell
Search-ADAccount -LockedOut
Unlock-ADAccount -Identity locktest
```

## DNS Troubleshooting

Intentionally changed `CLIENT01` to use an invalid DNS server (`10.10.10.99`) while leaving normal IP connectivity intact.

Troubleshooting showed that:

- `ping 10.10.10.10` still worked
- Active Directory DNS lookups timed out
- `nslookup company.local` failed against the bad DNS server

The workstation was restored to `10.10.10.10`, the DNS cache was flushed, and domain/resource access was verified.

![DNS troubleshooting failure](Screenshots/dns-troubleshooting.jpg)

See [Networking/README.md](Networking/README.md).

## PowerShell Diagnostic Script

Created `PC-Diagnostic.ps1` to collect common workstation troubleshooting information:

- Computer name
- Logged-in user
- Windows version/build
- IPv4 configuration
- DNS server configuration
- Network-adapter status
- Disk space
- Installed RAM
- Domain membership

The script also creates timestamped diagnostic reports.

![PowerShell diagnostic output](Screenshots/powershell-diagnostic.jpg)

See [PowerShell/PC-Diagnostic.ps1](PowerShell/PC-Diagnostic.ps1).

## Troubleshooting Scenarios

The `Troubleshooting-Tickets` folder contains simulated service-desk documentation covering:

1. Password reset
2. New employee onboarding
3. Employee offboarding
4. Shared-folder access
5. Network-drive mapping
6. Active Directory account lockout
7. Group Policy drive mapping
8. DNS resolution failure
9. Workstation diagnostic script

These exercises use a consistent support workflow:

**Understand -> Clarify -> Check basics -> Isolate -> Troubleshoot -> Verify -> Document -> Escalate when necessary**

## Notes

This is a personal training lab. All users, departments, credentials, and company data shown here are fictional. No production systems or real organizational credentials are included.
