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

```
