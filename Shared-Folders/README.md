# Shared Folders and Permissions

## Accounting Share

Created:

```text
C:\Shares\Accounting
```

Shared as:

```text
\\DC01\Accounting
```

## Authorization

The `Accounting-Users` security group was granted access using both:

- SMB share permissions
- NTFS file-system permissions

A Sales user was denied access as expected, while an Accounting user was able to open the share and create a test file.

## Troubleshooting Workflow

1. Verify connectivity to `DC01`.
2. Confirm the user is authenticated to `company.local`.
3. Review the user's Active Directory group memberships.
4. Review share permissions.
5. Review NTFS permissions.
6. Determine whether the denial is expected or requires authorized access changes.

This scenario demonstrated that not every reported access problem should result in permissions being granted.
