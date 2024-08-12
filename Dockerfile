FROM busybox:1.35.0-uclibc

# Tải xuống và cài đặt AWS CLI v2
RUN wget -O awscliv2.zip https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip ./aws

# Tải xuống và cài đặt kubectl
RUN wget -O /usr/local/bin/kubectl https://dl.k8s.io/release/$(wget -qO- https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x /usr/local/bin/kubectl

# Xác nhận cài đặt AWS CLI và kubectl
RUN aws --version && kubectl version --client
