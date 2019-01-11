#This script will delete the Kubernetes Cluster on AWS

kops delete cluster --name=$AWS_CLUSTER_NAME --state=$AWS_STATE --yes
