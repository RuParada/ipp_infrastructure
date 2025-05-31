# IPP DevOps Infrastructure

This project demonstrates modern DevOps practices applied to a Gatsby application (`ipp`). It includes:

* 🔧 **Dockerized build**
* 🚀 **CI/CD with Jenkins**
* ☁️ **Terraform for Vercel integration**
* ☸️ **Kubernetes deployment**
* 📊 **Monitoring with Prometheus + Grafana via Ansible & Helm**
* 🛠️ **Ansible for automation**

---

## 📦 Project Structure

```
project-root/
├── docker/           # Dockerfile for Gatsby app
├── jenkins/          # Jenkinsfile for CI/CD
├── k8s/              # K8s manifests (deployment, ingress, service)
├── terraform/        # Terraform config for Vercel
├── ansible/          # Ansible playbook to install monitoring stack
├── monitoring/       # Helm install script & namespace
├── scripts/          # Helper deployment script
└── ipp/              # Gatsby application source
```

---

## ✅ Prerequisites

* [Docker](https://docs.docker.com/get-docker/)
* [Kubernetes](https://minikube.sigs.k8s.io/docs/) (e.g. via Minikube)
* [Helm](https://helm.sh/)
* [Ansible](https://docs.ansible.com/)
* [Jenkins](https://www.jenkins.io/)
* [Terraform](https://developer.hashicorp.com/terraform)

---

## 🔁 CI/CD via Jenkins

Jenkins runs two stages:

1. **Build**: Dockerize the Gatsby app.
2. **Deploy**: Deploy to K8s via `scripts/deploy.sh`.

See [`jenkins/Jenkinsfile`](jenkins/Jenkinsfile).

---

## ☁️ Vercel Provisioning (via Terraform)

> Optional — only provisions project on Vercel, **not used for deployment**.

```bash
cd terraform/
terraform init
terraform apply -var="vercel_token=your_token"
```

---

## 🧪 Kubernetes Deployment

To deploy the app:

```bash
bash scripts/deploy.sh
```

---

## 📈 Monitoring Stack (Ansible + Helm)

Provision Prometheus and Grafana in your cluster:

```bash
ansible-galaxy collection install -r ansible/requirements.yml
ansible-playbook ansible/playbook.yml
```

Access services:

```bash
kubectl get svc -n monitoring
```

* Grafana: `http://localhost:<grafana-port>` (login: `admin` / `admin`)
* Prometheus: `http://localhost:<prometheus-port>`

---

## 📋 Tech Stack

| Tool       | Purpose                      |
| ---------- | ---------------------------- |
| Gatsby     | Static site generation       |
| Docker     | Containerization             |
| Jenkins    | CI/CD automation             |
| Kubernetes | Container orchestration      |
| Ansible    | Monitoring automation (Helm) |
| Helm       | K8s package manager          |
| Prometheus | Metrics collection           |
| Grafana    | Metrics visualization        |
| Terraform  | Vercel infrastructure mgmt   |

---