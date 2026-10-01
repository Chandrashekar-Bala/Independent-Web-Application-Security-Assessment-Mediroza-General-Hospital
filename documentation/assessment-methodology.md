# Assessment Methodology

This project documents an authorized black-box web application security assessment of `medirozahospital.com`.

## Methodological principles

1. Start from the external unauthenticated position.
2. Establish the attack surface before exploitation.
3. Validate scanner observations manually where practical.
4. Separate observations, hypotheses, findings and non-findings.
5. Preserve raw outputs alongside screenshots and reports.
6. Demonstrate impact without destructive activity.
7. Quantify affected data only to the extent necessary to prove impact.
8. Map findings to CVSS 3.1 and CWE where evidence supports the mapping.
9. Document tool limitations rather than converting inconclusive output into a claim.
10. Provide remediation and retest criteria that can be independently verified.

## Assessment flow

```text
Authorization & Scope
        ↓
External Reconnaissance
        ↓
Attack-Surface Enumeration
        ↓
Application Mapping
        ↓
Authentication Testing
        ↓
Input Validation Testing
        ↓
Controlled Exploitation
        ↓
Sensitive-Data Validation
        ↓
Cryptographic Analysis
        ↓
Evidence Correlation
        ↓
Risk Modeling
        ↓
Remediation Design
        ↓
Retest Criteria
```

## Evidence hierarchy

- Raw HTTP / protocol output
- Raw Nmap output
- Original downloaded artifacts
- Screenshots showing the same observation
- Hashes and integrity records
- Analyst interpretation
- Risk rating

Interpretation never replaces raw evidence.
