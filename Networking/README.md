# Networking and DNS Troubleshooting

## Addressing

```text
Lab network: 10.10.10.0/24
Gateway:     10.10.10.1
DC01:        10.10.10.10
CLIENT01:    10.10.10.20
DNS:         10.10.10.10
```

DHCP was disabled for the lab network and the two systems were configured manually.

## Verification Commands

```cmd
ipconfig /all
ping 10.10.10.10
nslookup company.local
```

## DNS Failure Scenario

To simulate a workstation DNS problem, `CLIENT01` was temporarily changed from:

```text
DNS: 10.10.10.10
```

to:

```text
DNS: 10.10.10.99
```

### Symptoms

- Direct IP connectivity to `DC01` still worked.
- Active Directory DNS queries timed out.
- `nslookup company.local` failed against `10.10.10.99`.

### Root Cause

The workstation was configured with an invalid DNS server.

### Resolution

Restored the preferred DNS server to:

```text
10.10.10.10
```

Then flushed the resolver cache:

```cmd
ipconfig /flushdns
```

Finally, DNS and domain-resource access were verified again.

## Key Lesson

A successful ping by IP proves basic network connectivity, but it does not prove DNS is functioning. Comparing IP-based tests with hostname-based tests helps isolate name-resolution problems.
