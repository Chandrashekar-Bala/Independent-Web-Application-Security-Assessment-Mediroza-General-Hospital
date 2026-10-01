# Findings Index

| ID | Severity | Finding | Evidence domain |
|---|---|---|---|
| F-01 | HIGH | Unauthenticated directory indexing / sensitive path disclosure | `/old/`, `/patient/`, `/staff/` |
| F-02 | CRITICAL | Unauthenticated internal HR database backup exposure | `/old/mediroza_db_backup_2019.sql` |
| F-03 | CRITICAL | SQL injection enabling patient authentication bypass | `/patient/login.php` |
| F-04 | MEDIUM | Verbose SQL error disclosure | patient login response |
| F-05 | HIGH | Sensitive patient-report retrieval following authentication bypass | `/patient/download.php?id=N` |
| F-06 | LOW | Predictable/disclosed patient-report storage path | `/patient/reports/` |
| F-07 | MEDIUM | Public error-log filename/metadata disclosure | `/patient/error_log` listing |
| F-08 | LOW | Server/hosting fingerprint disclosure | HTTP/service metadata |

## Severity legend

- 🔴 CRITICAL — immediate security exposure with severe confidentiality/integrity consequences
- 🔴 HIGH — significant compromise or sensitive-data exposure
- 🟠 MEDIUM — meaningful security weakness requiring remediation
- 🟢 LOW — limited direct impact but useful to attackers or indicative of hardening gaps
