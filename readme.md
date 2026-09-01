# 🏢 NovaTech Corporate Infrastructure & Security Homelab

![Project Status](https://img.shields.io/badge/Status-Phase_1_Completed-success?style=for-the-badge)
![Environment](https://img.shields.io/badge/Environment-VirtualBox_Lab-blue?style=for-the-badge)
![Target Architecture](https://img.shields.io/badge/Architecture-Windows_Server_2022_%7C_Active_Directory-0078D4?style=for-the-badge)

An enterprise-grade hybrid laboratory designed to simulate realistic IT infrastructure deployment, Identity & Access Management (IAM) automation, network service configuration, and security baselining for a modern corporate environment (**NovaTech Corp**).

---

## 🎯 Executive Overview & Project Goals

This project demonstrates practical skills in systems administration, network engineering, operational security, and PowerShell automation. The infrastructure is built incrementally across three distinct implementation phases, moving from basic operational identity to security enforcement and threat detection.

---

## 🗺️ Lab Architecture & Roadmap

```text
                        ┌───────────────────────────┐
                        │   VirtualBox NAT Network  │
                        │      192.168.10.0/24      │
                        └─────────────┬─────────────┘
                                      │
           ┌──────────────────────────┼──────────────────────────┐
           │                          │                          │
 ┌─────────┴─────────┐      ┌─────────┴─────────┐      ┌─────────┴─────────┐
 │       DC-01       │      │       FS-01       │      │       CL-01       │
 │  Domain Controller│      │    File Server    │      │   Domain Client   │
 │  (Win Server 22)  │      │  (Win Server 22)  │      │    (Windows 10)   │
 │   192.168.10.2    │      │   192.168.10.3    │      │   192.168.10.50   │
 └───────────────────┘      └───────────────────┘      └───────────────────┘
```

* **Phase 1: Foundation (Windows Server, AD DS, DNS, DHCP & Automation)** — **`COMPLETED`**
* **Phase 2: Corporate File Sharing, Access Control & GPO Security** — *In Progress*
* **Phase 3: Threat Detection, Logging & Security Auditing** — *Planned*

---

## 🛠️ Phase 1 Highlights & Technical Specs

Phase 1 establishes a fully functional Enterprise Identity & Infrastructure Base:
- **Primary Domain Controller:** `DC-01.novatech.local` (`192.168.10.2`)
- **Core Services:** Active Directory Domain Services (AD DS), DNS Server (with external forwarders), and DHCP Server (`Corporate-LAN` scope).
- **Automated IAM:** Provisioned Organizational Units (`TI`, `RH`, `Financeiro`, `Vendas`) and domain user accounts using a modular PowerShell script (`create-users.ps1`) integrated with CSV data sourcing.

---

## 📂 Project Structure

```text
homelab-novatech/
├── docs/
│   ├── phase1-fundation.md     # Detailed Phase 1 technical documentation
│   ├── phase2-fundation.md     # Phase 2 documentation (coming soon)
│   └── phase3-fundation.md     # Phase 3 documentation (coming soon)
├── screenshots/                # Evidence artifacts and verification proofs
├── scripts/
│   ├── create-users.ps1        # Automated AD user & OU provisioning script
│   └── usuarios-novatech.csv   # Data source for identity provisioning
└── readme.md                   # Main lab overview
```

---

## 📄 Phase Documentation Shortcuts

- [📘 Detailed Phase 1 Walkthrough & Screenshots](./docs/phase1-fundation.md)

---

## 🛡️ Key Skills Demonstrated

- **Identity & Access Management:** AD DS Forest initialization, OU topology design, CSV-driven PowerShell automation.
- **Network Services Infrastructure:** Static IPv4 configurations, loopback DNS configuration, DHCP Scope options (003, 006, 015), external DNS forwarding.
- **Troubleshooting & Remediation:** Execution policy configuration, VirtualBox Guest Integration driver mounting, UTF-8 encoded script output.