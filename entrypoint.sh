echo 'Starting Container...'

if [ ! -f /root/.ssh/id_rsa.pub ]; then
	ssh-keygen -f ~/.ssh/id_rsa
fi

if [ ! -f /root/.aws/credentials ]; then
	aws configure
fi

