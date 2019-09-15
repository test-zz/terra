# terra

```
git clone https://github.com/test-zz/terra.git

cd terra

chmod +x setup.sh

./setup.sh

terraform apply -var="project=$(gcloud config get-value project)" \
  -var="ssh_user=$(whoami)" \
  -var="ssh_filename=~/.ssh/$(whoami).pub" \
  -var="script_path=metadata_startup_script.sh"
  
pushd ../jenkins-x-workshop/
./install-jx.sh -v 2.0.643

gcloud config list project
export PROJECT_ID=$(gcloud config get-value project)
echo $PROJECT_ID

gcloud compute project-info describe

jx create cluster gke --no-tiller --skip-login --default-admin-password=admin --project-id=${PROJECT_ID} --cluster-name=jenkins-x-lab --zone=europe-west1-d --version=2.0.643 #--version=2.0.330

cat ~/.jx/adminSecrets.yaml

kubectl -n jx get pods

jx get urls

jx get environments


```
