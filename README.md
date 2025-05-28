# Appscrip-Assignment
This project provisions an Amazon EKS cluster using Terraform, deploys an NGINX web application via Kubernetes manifests, manages deployments using Argo CD (GitOps), and optionally exposes the app via Ingress and a custom domain.
## 1. Setup Terraform & AWS CLI
### Install Terraform
```
# Linux & macOS
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform
```
Verify Installation
```
terraform -v
```
### Install AWS CLI
```
sudo apt-get install python3-pip
sudo pip install awscli
```
Verify Installation
```
aws --version
```
Configure AWS Console
```
aws configure
```

### Execute Terraform Configurations:
Step into project directory
```
cd terraform
```
Initialize Terraform modules
```
terraform init
```
Review the execution plan
```
terraform plan
```
Apply the infrastructure changes
```
terraform apply --auto-approve
```
### Access your EKS cluster:
Update kubeconfig
```
aws eks --region us-east-1 update-kubeconfig --name eks-cluster
```
Verify cluster access
```
kubectl get nodes
```
## ArgoCD Login Instructions

### 1. Install ArgoCD:
```
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```
### 2. Expose ArgoCD via LoadBalancer:
```
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
kubectl get svc argocd-server -n argocd
```
### 3. Retrieve the Admin Password:
```
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```
### 4. Access ArgoCD:
```
* Search this URL: http://<external-ip>:80
* Username: admin
* Password: Retrieved above
```
### 5. Create & Apply ArgoCD Application:
```
kubectl apply -f ArgoCD_app.yaml
```

## Public Access for NGINX 
### 1. LoadBalancer (Public Access)
Change the Server type:
```
kubectl patch svc nginx-service -p '{"spec": {"type": "LoadBalancer"}}'
```
Retrieve the IP,
```
kubectl get svc nginx-service
```
Visit the URL:
```
http://<external-ip>
```
## ** Conclusion **
This README covers all the commands used to provisions an Amazon EKS cluster using Terraform, deploys an NGINX web application via Kubernetes manifests, manages deployments using Argo CD (GitOps).

### 📧 Maintained By
#### KARTIK KAIN
#### Analyst, HCLTech | Cloud & DevOps Engineer
[LinkedIN](https://www.linkein.com/in/kartikkain) | [GitHub](https://github.com/MrKainn)




