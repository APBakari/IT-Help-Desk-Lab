# Interview Talking Points

## Tell me about your Active Directory experience
I built a Windows Server 2025 home lab with Active Directory and DNS, created a `company.local` domain, organized users into departmental OUs, managed security groups, joined a Windows 11 workstation to the domain, and tested domain-user authentication.

## Tell me about a permissions issue you troubleshot
I created an Accounting file share that was restricted to the `Accounting-Users` group. I verified that a Sales user could reach the server but was denied access, checked their group membership and the share/NTFS permissions, and confirmed the denial was expected. I then verified that an authorized Accounting user could access and write to the share.

## Tell me about a DNS issue you solved
I intentionally configured a workstation with an invalid DNS server. Direct IP connectivity to the domain controller still worked, but Active Directory DNS lookups failed. I compared IP-based and hostname-based tests, identified the wrong DNS server in `ipconfig /all`, restored the domain controller as DNS, flushed the resolver cache, and verified name resolution.

## Tell me about Group Policy
I created and linked a GPO to the Accounting OU and used Group Policy Preferences to automatically map the Accounting department share as drive `A:`. I verified it with `gpresult /r`, `net use`, and File Explorer.

## Tell me about PowerShell
I created a PowerShell workstation diagnostic script that reports the computer name, logged-in user, Windows version, IP/DNS configuration, adapter status, disk space, RAM, and domain membership. It also saves timestamped text reports.
