FROM busybox:1.35.0-uclibc

# Cài đặt các công cụ cần thiết (wget, unzip)
RUN wget -O - https://github.com/aws/aws-cli/releases/download/2.0.30/awscli-exe-linux-x86_64.zip > awscliv2.zip && \
    mkdir -p /aws-cli && \
    unzip awscliv2.zip -d /aws-cli && \
    /aws-cli/aws/install && \
    rm -rf awscliv2.zip /aws-cli

# Cài đặt kubectl
RUN wget -O /usr/local/bin/kubectl https://dl.k8s.io/release/$(wget -qO- https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x /usr/local/bin/kubectl

# Xác nhận cài đặt AWS CLI và kubectl
RUN aws --version && kubectl version --client
