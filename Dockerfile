FROM python

# Install kops
RUN curl -Lo kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
RUN chmod +x ./kops
RUN mv ./kops /usr/local/bin/

# Install KubeCTL
RUN curl -Lo kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

# Install AWSCLI
RUN pip install awscli

COPY entrypoint.sh /
COPY create_cluster.sh /
COPY delete_cluster.sh /

RUN echo "cd /workdir" >> /root/.bashrc

CMD ["bash", "-c", "/entrypoint.sh"]