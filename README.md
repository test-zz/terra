# terra

git clone https://github.com/test-zz/terra.git

cd terra

chmod +x setup.sh

./setup.sh

terraform apply -var="project=$(gcloud config get-value project)"
