# Task-to-Evidence Map

This map connects the original assessment objectives to the preserved evidence.

| Milestone | Objective | Primary evidence |
|---|---|---|
| M1 | Initial access and retrieval of three patient reports | `02_EVIDENCE_MASTER/04_Web_App_Access/`, `06_Patient_Reports/` |
| M2 | Analyze and recover protection on all three PDFs | `02_EVIDENCE_MASTER/07_PDF_Cracking/`, `06_Patient_Reports/`, screenshots |
| M3 | Identify staff salary and shareholder exposure | `02_EVIDENCE_MASTER/08_Database_Exposure/`, `04_Web_App_Access/` |
| M4 | Produce complete professional assessment | `01_FINAL_REPORT/` |

## M1 evidence chain

```text
Recon
  → patient/login.php
  → baseline POST
  → SQL error
  → controlled SQLi payload
  → HTTP 302
  → portal.php
  → three report links
  → three PDF downloads
```

## M2 evidence chain

```text
PDF acquisition
  → PDF format inspection
  → encryption metadata
  → hash extraction
  → JtR loader limitation
  → pdfcrack recovery
  → qpdf decryption / validation
```

## M3 evidence chain

```text
/old/ directory listing
  → public SQL backup
  → backup header inspection
  → staff table
  → shareholder table
  → quantitative exposure analysis
```

## M4 evidence chain

```text
Raw evidence
  → correlation
  → finding classification
  → CVSS/CWE
  → root cause
  → remediation
  → detection
  → retest criteria
```
