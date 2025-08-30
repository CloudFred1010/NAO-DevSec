# 🔹 Secure DevSecOps Project – Step-by-Step Implementation Guide (Final Expert Edition)

---

## Phase 1 – Prerequisites & Environment Setup

**Objective:** Establish the tools, accounts, and services needed for the project.

### Local Tooling Installation
Install:
- Docker & Docker Compose
- Node.js (LTS version)
- Git
- Terraform or Bicep CLI
- Azure CLI
- Security tools: Trivy, Snyk, Checkov, Syft/Grype

### Azure Subscription Preparation
- Ensure contributor-level access.
- Enable **Microsoft Defender for Cloud** for workload protection.
- Create and connect a **Log Analytics workspace**.
- Onboard to **Azure Sentinel** for SIEM.
- Confirm **Cost Management + Billing** is enabled.

### Repository Structure
Initialise a GitHub or Azure DevOps repo with:
- `/app`        → Juice Shop source
- `/iac`        → Terraform or Bicep templates
- `/pipelines`  → CI/CD workflows
- `README.md`   → Documentation

---

## Phase 2 – Git Hygiene & Pre-Commit Controls

**Objective:** Prevent insecure or misconfigured code from entering the repo.

- Install and configure **pre-commit** framework locally.
- Add hooks for:
  - Secret detection (Gitleaks).
  - IaC scanning (Checkov).
  - YAML/JSON validation.
- Test by committing code and verify scans run automatically.

**Outcome:** You ensure no secrets, broken configs, or insecure IaC reach the pipeline.

---

## Phase 3 – Application Layer

**Objective:** Deploy and secure the vulnerable workload.

- Clone and containerise **OWASP Juice Shop**.
- Run locally in Docker to confirm application works.
- Harden the container:
  - Use a **multi-stage Dockerfile**.
  - Run as a **non-root user**.
  - Scan image with **Trivy** for vulnerabilities.

---

## Phase 4 – Infrastructure as Code (IaC)

**Objective:** Build secure and repeatable Azure infrastructure.

- Write Terraform/Bicep templates to provision:
  - App Service for Containers
  - Hardened Linux VM (CIS baseline, NSGs restricted to HTTPS + JIT SSH)
  - Azure Key Vault (secrets, TLS certs, API keys)
  - Azure Container Registry (ACR)
  - Log Analytics workspace linked to Sentinel
  - Azure Policies to enforce guardrails (HTTPS-only, encryption, deny public IPs)

- Deploy and validate resources using `terraform plan → terraform apply`.

**Outcome:** A secure, policy-enforced Azure environment ready for CI/CD deployment.

---

## Phase 5 – CI/CD Pipeline

**Objective:** Automate build, test, security scans, and deployment.

Define pipeline stages:

- **Commit Stage** → unit & integration tests.
- **Security Stage** →
  - SAST (CodeQL/SonarQube).
  - SCA (Snyk/Dependabot).
  - IaC scanning (Checkov).
  - Container scanning (Trivy).
  - SBOM generation (Syft/Grype).
- **Build & Deploy Stage** → build/push container → deploy to App Service + VM.
- **Post-Deploy Stage** → run OWASP ZAP scan, enforce Azure Policy compliance.

Configure GitHub Actions or Azure DevOps pipelines.

**Outcome:** Every commit triggers security checks, automated builds, and deployments with compliance validation.

---

## Phase 6 – Security Enhancements

**Objective:** Strengthen deployment with advanced security practices.

### Secrets Management
- Store all secrets in Azure Key Vault.
- Enable automatic rotation.
- Prevent plaintext secrets in repos/pipelines.

### Zero Trust Enforcement
- Require MFA + Conditional Access (Entra ID).
- Isolate workloads using micro-segmentation (VNETs).
- Enable Just-in-Time (JIT) access for VM administration.

### Supply Chain Security
- Enable dependency scanning with Snyk/Dependabot.
- Generate SBOMs on each build.
- Track and assess third-party risks.

---

## Phase 7 – Logging, Monitoring & Incident Response

**Objective:** Achieve observability and ensure incident readiness.

### Logging & Observability
- Centralise logs into **Log Analytics + App Insights**.
- Correlate logs in Sentinel for analysis.
- Ensure immutable storage for audit/non-repudiation.

### Incident Detection & Response
- Configure Sentinel rules for:
  - Failed logins.
  - Suspicious outbound traffic.
  - VM/container anomalies.
- Automate playbooks with Logic Apps: isolate resource + notify Teams/Slack.
- Maintain an Incident Response process: triage → contain → eradicate → recover → review.

---

## Phase 8 – Governance & Compliance

**Objective:** Provide evidence and reporting for stakeholders.

- Map controls to **ISO 27001, GDPR, NIST CSF**.
- Capture audit evidence: IaC outputs, scan reports, Sentinel logs.
- Build dashboards for visibility:
  - **Azure DevOps Boards** → backlog + vulnerabilities.
  - **Sentinel Workbooks** → live incident views.
  - **Power BI** → exec-level security posture + cost.

---

## Phase 9 – Cost Management

**Objective:** Keep deployment secure and cost-effective.

- Use Azure Cost Management dashboards to track spend.
- Rightsize resources (VM size, App Service tier, ACR plan).
- Auto-shutdown non-production VMs.
- Report monthly costs alongside security posture.

---

## Phase 10 – Final Validation & Demo Prep

**Objective:** End-to-end validation and interview readiness.

- Run a full CI/CD pipeline → confirm scans, build, deploy, monitoring, alerts.
- Simulate an attack (e.g., brute-force login) → verify Sentinel detects + playbook responds.
- Review STRIDE threat model → demonstrate risks + mitigations.
- Prepare a demo walk-through:
  - Code commit → pre-commit check → pipeline scans → Azure deployment → Sentinel alert.
  - Highlight how each stage aligns to JD requirements (DevSecOps, SSDLC, risk management, audit, incident response).

---

## ✅ Outcome

By following this process, you will:
- Deliver a **working Azure-hosted DevSecOps pipeline**.
- Embed **security across SSDLC, pipelines, IaC, and Azure services**.
- Demonstrate **ISO/GDPR/NIST alignment and governance**.
- Show **incident readiness** with Sentinel & Defender.
- Optimise costs without reducing security.
- Be fully prepared to **talk and demo every part of the NAO job description**.
