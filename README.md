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

# can use:
# https://jenkins-x.io/commands/jx_create_terraform/ ?
jx create cluster gke \
  --no-tiller \
  --skip-login \
  --default-admin-password=admin \
  --project-id=${PROJECT_ID} \
  --cluster-name=jenkins-x-lab \
  --zone=europe-west1-d \
  --version=2.0.643 \
  --default-environment-prefix jx \
  --environment-git-owner test-zz \
  --docker-registry gcr.io \
  --docker-registry-org ${PROJECT_ID} \
  --tekton \
  --kaniko
  #--version=2.0.330
#jx install --no-tiller --default-admin-password=admin


kubectl -n jx get pods

jx get urls

jx get environments

popd

pushd ..

#https://github.com/dcanadillas/jenkins-x-workshop/blob/master/labs/JXQuickstart.md
mkdir -p ~/jx-gke-lab && cd ~/jx-gke-lab

#jx create quickstart -l go -f http -p jx-go-http -b
jx create quickstart -l go -f golang-http -p jx-go-http -b




```

maybe necessary?:
```
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install git


https://github.com/jenkins-x/jx/issues/3857
jx install --provider gke \
--default-admin-password admin \
--default-environment-prefix jx \
--environment-git-owner ewann \
--docker-registry gcr.io --docker-registry-org ${PROJECT_ID} \
--tekton \
--kaniko \
--no-tiller 
cat ~/.jx/adminSecrets.yaml

```
