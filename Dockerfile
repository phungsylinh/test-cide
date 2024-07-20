# Sử dụng image cơ sở, ví dụ: Alpine
FROM alpine:latest

# Cài đặt các công cụ cần thiết, ví dụ: curl
RUN apk --no-cache add curl

# Đặt thư mục làm việc
WORKDIR /app

# Sao chép tệp từ hệ thống tệp của bạn vào container
COPY . /app

# Đặt lệnh mặc định để chạy khi container khởi động
CMD ["sh"]
