# Group Policy

## Accounting Drive Mapping

A Group Policy Object named `Accounting Drive Mapping` was linked to the Accounting OU.

The GPO uses Group Policy Preferences:

`User Configuration -> Preferences -> Windows Settings -> Drive Maps`

Configuration:

```text
Action: Update
Location: \\DC01\Accounting
Drive Letter: A:
Label: Accounting
```

## Verification

On `CLIENT01`, while signed in as an Accounting user:

```cmd
net use
gpresult /r
```

`net use` showed:

```text
A:    \\DC01\Accounting
```

`gpresult /r` showed `Accounting Drive Mapping` under Applied Group Policy Objects.

This demonstrated centralized user configuration rather than manually mapping the drive on each workstation.
