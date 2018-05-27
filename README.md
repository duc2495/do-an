# Kubernetes Web UI & Proactive Autoscaler with RNN model
Xin chào, mình là Nguyễn Đình Đức, sinh viên trường Đại học Bách Khoa Hà Nội. Đây là đồ án tốt nghiệp của mình.
# Giới thiệu đề tài
Xây dựng hệ thống quản trị và tự động co giãn tài nguyên Container cho Kubernetes sử dụng mô hình dự đoán mạng nơ-ron tái phát.
# Hướng dẫn triển khai
Các ứng dụng đã được đóng gói thành images và được đẩy lên Docker Hub với Repositories `duc2495`. Sau đây là các bước triển khai hệ thống lên Kubernetes. 
## Điều kiện tiên quyết
Trước khi triển khai hệ thống yêu cầu một số điều kiện sau:
- Đã cài đặt cụm Kubernetes (hỗ trợ phiên bản 1.9 trở lên). Nếu chưa, có thể cài đặt với [kubeadm](https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/)
- Cài đặt hệ thống giám sát [Heapster, Grafana, InfluxDB](https://github.com/kubernetes/heapster/blob/master/docs/influxdb.md) trên Kubernetes. 
- Trên cụm Kubernetes cần triển khai sẵn [Persistent Volume](https://kubernetes.io/docs/concepts/storage/persistent-volumes/) để lưu trữ dữ liệu lâu dài.
## Tải mã nguồn từ github 
Mở Terminer lên và chạy lệnh sau:
> git clone https://github.com/duc2495/do-an.git 

Sau khi tải về thành công, truy cập vào thư mục `do-an` với lệnh sau:
> cd do-an
## Triển khai model dự đoán với Tensorflow Serving
Triển khai Tensorflow Serving lên Kubernetes với file `tensorflow-serving.yaml`.
> kubectl create -f tensorflow-serving.yaml
## Triển khai Web UI
1. Cấp quyền truy cập cụm Kubernetes cho thư viện [Kubernetes Java client](https://github.com/fabric8io/kubernetes-client) của fabric8io với file `fabric8-rbac.yaml`.
   > kubectl create -f fabric8-rbac.yaml

2. Triển khai cơ sở dữ liệu PostgreSQL cho Web UI với file `dashboard-postgres.yaml`
   > kubectl create -f dashboard-postgres.yaml

3. Triển khai Web UI lên Kubernetes với file `dashboard.yaml`
   > kubectl create -f dashboard.yaml
  
Truy cập vào Web UI trên node `master` qua địa chỉ  [master:30080](http://master:30080), với `master` là tên node, hoặc có thể thay `master` bằng địa chỉ `ip` (ví dụ như [192.168.1.1:30080](http://192.168.1.1:30080))




