FROM alpine:3.12

# Cài đặt các công cụ cần thiết
RUN apk add --no-cache curl unzip bash

# Tải xuống và cài đặt AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip ./aws

# Tải xuống và cài đặt kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && mv kubectl /usr/local/bin/

# Xác nhận cài đặt AWS CLI và kubectl
RUN aws --version && kubectl version --client
