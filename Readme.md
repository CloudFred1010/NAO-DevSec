# 🔹 Secure DevSecOps Project – Azure End-to-End Implementation

## 1. Project Overview
This project demonstrates how to implement a **DevSecOps pipeline in Azure** that aligns with the responsibilities of a DevSecOps Engineer (Azure Cloud).

It uses a deliberately vulnerable application (**OWASP Juice Shop**) as the workload to showcase how security is embedded from **code → pipeline → cloud infrastructure → monitoring & governance**.

The design ensures compliance with **ISO 27001, GDPR, NIST** and embeds NAO’s strategic principles of **security by design, continuous improvement, and cultural enablement**.

---

## 2. Architecture at a Glance

### Application
- OWASP Juice Shop (Node.js vulnerable app).  
- Runs in two deployment models:  
  - Docker container in **Azure App Service for Containers**.  
  - Hardened **Linux VM** deployment for network/VM security showcase.  

### Infrastructure (IaC)
- Terraform/Bicep provisions:  
  - App Service, Container Registry, Linux VM, Key Vault, Log Analytics, Sentinel.  
  - NSGs with least-privilege rules.  
  - Azure Policy for compliance guardrails.  

### CI/CD (Azure DevOps / GitHub Actions)
- Code build/test + automated security scans.  
- Container and IaC scanning before deployment.  
- Automated deployment to Azure App Service and VM.  
- Post-deployment DAST scans.  

### Security & Governance
- **Zero Trust** enforced via Entra ID MFA, Conditional Access, micro-segmentation, JIT VM access.  
- **Secrets Management** with Azure Key Vault.  
- **Defender for Cloud + Sentinel** for posture management and incident response.  
- **Cost Management** with Azure dashboards and rightsizing strategies.  

---

## 3. Key Security Domains

### 3.1 Application Security & SSDLC
- Secure Software Development Lifecycle (SSDLC) integrated.  
- Automated testing for OWASP Top 10.  
- Secure code reviews + automated SAST/DAST.  
- Pen test outputs integrated into backlog.  

### 3.2 Secrets Management
- Azure Key Vault stores all credentials, API keys, and TLS certificates.  
- Key rotation policies applied.  
- Pipeline integrates with GitHub secret scanning to prevent leaks.  

### 3.3 Logging & Observability
- Centralised logs in **Log Analytics** and **App Insights**.  
- Logs correlated with **Sentinel incidents**.  
- Immutable storage for non-repudiation.  

### 3.4 Zero Trust Security
- Entra ID MFA + Conditional Access on all services.  
- **Micro-segmentation** across VNETs for workloads.  
- **Just-In-Time (JIT)** access for VMs.  

### 3.5 Supply Chain Security
- Dependency scanning (Snyk, Dependabot).  
- SBOM generation (Syft/Grype) included in CI/CD pipeline.  
- Vendor risk assessments documented for third-party libraries.  

### 3.6 Testing Strategy
- Unit, Integration, and Security testing embedded in CI/CD.  
- Policy-as-Code enforced using **Azure Policy** and **OPA/Rego**.  
- Quality gates prevent deployment of insecure builds.  

### 3.7 Governance & Reporting
- Compliance evidence mapped to **ISO 27001, GDPR, NIST**.  
- Risk and posture dashboards shared with audit/leadership:  
  - **Azure DevOps Boards** for backlog tracking.  
  - **Sentinel Workbooks** for incident dashboards.  
  - **Power BI reports** for executives.  

---

## 4. Threat Modelling
Applied **STRIDE framework** to Juice Shop architecture:  
- **Spoofing** → Entra ID authentication, JWT validation.  
- **Tampering** → signed images, IaC version control with approvals.  
- **Repudiation** → centralised logging, Sentinel correlation.  
- **Information Disclosure** → TLS enforced, Key Vault secrets, encryption at rest.  
- **Denial of Service** → WAF + App Service autoscaling.  
- **Elevation of Privilege** → least privilege RBAC, PIM.  

---

## 5. CI/CD Pipeline Workflow

### Commit Stage
- Developer pushes code → pipeline triggers.  
- Unit + Integration tests run.  

### Security Stage
- **SAST**: CodeQL/SonarQube scan.  
- **SCA**: Snyk/Dependabot dependency checks.  
- **IaC Scan**: Checkov/TerraScan for Terraform/Bicep.  
- **Container Scan**: Trivy checks Docker image.  
- **SBOM Generation**: Syft creates SBOM.  

### Build & Deploy Stage
- Multi-stage Docker build (non-root user, minimal base).  
- Deployment to Azure App Service & Linux VM.  

### Post-Deploy Stage
- **DAST**: OWASP ZAP scan against live app.  
- Logs pushed to Sentinel.  
- Azure Policy compliance check enforced.  

---

## 6. Network & VM Security

### VM Security
- Hardened Linux VM (CIS benchmarks).  
- NSG rules: restrict SSH, allow only HTTPS from trusted sources.  
- JIT VM access enabled.  
- Defender for Cloud vulnerability assessments.  

### Container Security
- Containers run as non-root.  
- Secured with ACR and VNET Integration.  
- Trivy scans for CVEs in build.  
- Defender for Containers monitors runtime.  

---

## 7. Incident Management
1. Sentinel detects suspicious activity (e.g. brute-force login).  
2. Automated playbook (Logic App) notifies Teams/Slack + isolates resource.  
3. Incident Response: triage → contain → eradicate → recover.  
4. Post-Incident Review: feed lessons into backlog + process updates.  

---

## 8. Cost Management
- Azure Cost Management dashboards for App Service, VM, ACR, Defender, Sentinel.  
- Rightsizing of services + auto-shutdown of non-prod VMs.  
- Monthly cost review with InfoSec & Finance teams.  

---

## 9. Tools & Services Summary

### Security Tools
- CodeQL / SonarQube (SAST)  
- OWASP ZAP (DAST)  
- Snyk / Dependabot (SCA)  
- Trivy (Container scanning)  
- Checkov / TerraScan (IaC scanning)  
- Syft / Grype (SBOM generation)  

### Azure Native
- Defender for Cloud  
- Sentinel  
- Azure Policy  
- Entra ID (MFA, PIM, Conditional Access)  
- Key Vault  
- Cost Management  

### Governance
- ISO 27001, GDPR, NIST CSF mapping  
- Azure DevOps Boards, Sentinel Workbooks, Power BI dashboards  
