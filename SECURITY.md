# Security Policy

## Overview

Security is a shared responsibility. This repository follows secure software development practices and uses GitHub security capabilities to identify, track, and remediate security risks throughout the software development lifecycle.

Security controls include:

* Dependency management and Dependabot
* Dependency graph and SBOM
* Code scanning with CodeQL
* Security and Quality query suite
* Custom CodeQL queries
* Secret scanning and push protection
* Security advisories
* Pull request and branch protection
* SARIF-based security analysis
* Security alert triage and remediation

---

## Supported Versions

Security fixes are provided for the following versions:

| Version        | Supported |
| -------------- | --------- |
| `main`         | ✅         |
| Latest release | ✅         |
| Older releases | ❌         |

For security fixes, please use the latest supported version whenever possible.

---

## Reporting a Vulnerability

**Do not report security vulnerabilities through public GitHub issues, pull requests, or discussions.**

If you discover a potential vulnerability, report it privately through one of the following mechanisms:

1. **GitHub Private Vulnerability Reporting**, if enabled for this repository.
2. **GitHub Security Advisories**.
3. Contact the repository security team through the organization's approved security communication channel.

Please provide enough information to reproduce and assess the issue.

### Recommended report information

Include:

* Vulnerability description
* Affected component
* Affected version or commit
* Reproduction steps
* Proof of concept, where appropriate
* Expected behavior
* Actual behavior
* Potential security impact
* Suggested remediation, if known

Avoid including credentials, production secrets, personal information, or other sensitive data in the report.

---

## Security Response Process

Security reports are handled through the following lifecycle:

```text
Security Report
      │
      ▼
Initial Triage
      │
      ▼
Validate Vulnerability
      │
      ▼
Determine Severity
      │
      ▼
Identify Affected Components
      │
      ▼
Develop Remediation
      │
      ▼
Security Testing
      │
      ▼
Code Review
      │
      ▼
Release / Deployment
      │
      ▼
Verify Remediation
      │
      ▼
Close Security Issue
```

The security team may request additional information during triage.

---

## Automated Security Controls

### Code Scanning

This repository uses GitHub CodeQL for static application security testing.

The CodeQL pipeline may include:

* Default security queries
* `security-extended`
* `security-and-quality`
* Organization-specific custom queries

Custom queries are maintained under:

```text
.github/codeql/custom/
```

Example:

```text
.github/codeql/custom/avoid-eval.ql
```

Code scanning results are uploaded to GitHub Code Scanning using SARIF.

---

### Dependency Security

Dependabot is used to monitor supported dependencies for known vulnerabilities.

Dependency sources may include:

* Python / pip
* JavaScript / npm
* Other ecosystems as configured by the repository

Security updates may be grouped to simplify remediation.

Example:

```yaml
groups:
  security-updates:
    applies-to: security-updates
    patterns:
      - "*"
```

---

### Secret Scanning

Secret scanning is used to identify credentials and other sensitive authentication material committed to the repository.

Where available, push protection is enabled to prevent supported secrets from being committed.

If you accidentally expose a credential:

1. Do not commit additional copies of the credential.
2. Revoke or rotate the credential immediately.
3. Notify the appropriate security team.
4. Remove the secret from the source code.
5. Review repository history where necessary.
6. Verify that the replacement credential is securely stored.

**Removing a secret from the latest commit does not necessarily remove it from Git history.**

---

## Security Alert Management

Security alerts should be triaged according to organizational security procedures.

Security teams may use:

* Code Scanning alerts
* Dependabot alerts
* Secret Scanning alerts
* Security Overview
* Repository security advisories
* GitHub REST APIs
* SARIF reports

Alert states should accurately reflect the current status of the finding.

Examples include:

```text
Open
Fixed
Dismissed
```

Dismissals should include an appropriate reason and, where required, supporting documentation.

---

## Pull Request Security

Security-sensitive changes should go through the organization's standard pull request process.

Recommended controls include:

* Required pull request reviews
* CODEOWNERS
* Required status checks
* Code scanning checks
* Dependency review
* Branch protection or repository rulesets
* Restricted direct pushes to protected branches

Example lifecycle:

```text
Developer
   │
   ▼
Feature Branch
   │
   ▼
Pull Request
   │
   ├── CodeQL
   ├── Dependency Review
   ├── Tests
   ├── Secret Scanning
   └── Other Security Checks
   │
   ▼
Code Review
   │
   ▼
Security Checks Pass
   │
   ▼
Merge
```

---

## Security Severity

Security issues should be assessed using the organization's approved vulnerability classification process.

Where applicable, assessment may consider:

* Exploitability
* Impact
* Affected assets
* Exposure
* Authentication requirements
* Privilege requirements
* Availability impact
* Confidentiality impact
* Integrity impact
* Availability of a known exploit
* Business and regulatory impact

Severity should not be inferred solely from the alert title.

---

## Sensitive Information

Never commit the following to the repository:

```text
Passwords
API keys
Access tokens
Private keys
Connection strings containing credentials
Certificates containing private material
Production secrets
Cloud credentials
Database credentials
Personal or confidential information
```

Use approved secret-management mechanisms instead.

Examples include:

* GitHub Actions secrets
* GitHub Actions variables
* Enterprise-approved secret stores
* Cloud secret-management services

---

## Third-Party Dependencies

Third-party dependencies should be obtained from trusted sources and kept up to date.

Before introducing a dependency, consider:

* Project maintenance
* Known vulnerabilities
* License requirements
* Dependency provenance
* Package reputation
* Transitive dependencies
* Required permissions
* Security advisories

Where applicable, dependency changes should be reviewed through the normal pull request process.

---

## Security Automation

Security workflows should use pinned or controlled GitHub Actions versions according to organizational policy.

Security workflows should have the minimum permissions required.

For example:

```yaml
permissions:
  contents: read
  security-events: write
```

Avoid granting:

```yaml
permissions: write-all
```

unless explicitly required and approved.

---

## Incident Response

If a security incident is suspected:

1. Protect affected credentials and systems.
2. Revoke exposed credentials.
3. Preserve relevant evidence.
4. Notify the appropriate security team.
5. Identify affected repositories, applications, and environments.
6. Determine the scope and impact.
7. Remediate the vulnerability.
8. Validate the remediation.
9. Document lessons learned.

Do not publicly disclose incident details before the organization's security team has completed its assessment.

---

## Security Contacts

Security-related communication should use the organization's approved security contact or security team.

For this repository, the designated security contact is:

```text
Security Team: <ORGANIZATION_SECURITY_TEAM>
Security Email: <SECURITY_EMAIL>
```

Replace the placeholders with the organization's approved contact information.

---

## Responsible Disclosure

We encourage responsible disclosure of security vulnerabilities.

Please allow the security team reasonable time to investigate and remediate a reported vulnerability before publicly disclosing technical details.

We appreciate responsible security research that helps improve the security of this project.

---

## Security Governance

This repository may be subject to organization- or enterprise-level security policies.

Enterprise controls may include:

* Repository rulesets
* Organization policies
* Security policies
* GitHub Advanced Security
* CodeQL standards
* Secret scanning policies
* Dependabot policies
* Actions policies
* Identity and access controls
* Audit logging
* Security alert governance

Repository-level settings must not be used to bypass mandatory organization or enterprise security controls.

---

## Document Ownership

**Owner:** Security / Platform Engineering
**Review Frequency:** At least annually and whenever security requirements change
**Document:** `SECURITY.md`
