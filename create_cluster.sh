#This scripts will create the Kubernetes Cluster on AWS

kops create cluster --name=$AWS_CLUSTER_NAME --state=$AWS_STATE --zones=$AWS_ZONES --node-count=$AWS_NODE_COUNT --node-size=t2.micro --master-size=t2.micro --dns-zone=$AWS_DNS_ZONE
kops update cluster $AWS_CLUSTER_NAME --yes --state=$AWS_STATE
kops create secret --name=$AWS_CLUSTER_NAME --state=$AWS_STATE sshpublickey admin -i /root/.ssh/id_rsa.pub
