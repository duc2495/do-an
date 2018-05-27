# Hướng dẫn đóng gói Tensorflow client với docker image
## Điều kiện tiên quyết
Trước khi đóng gói ứng dụng yêu cầu đã cài đặt [Docker](https://docs.docker.com/install/). 
## Tải mã nguồn từ github 
Mở Terminer lên và chạy lệnh sau:
> git clone https://github.com/duc2495/do-an.git 

Sau khi tải về thành công, truy cập vào thư mục `do-an/tensorflow-client` với lệnh sau:
> cd do-an/ProactiveAutoscaler/tensorflow-client

## Đóng gói Tensorflow client
1. Mở 1 terminer khác chạy một container với ubuntu image
   > sudo docker run -it --name tf-client-container ubuntu:16.04 bash 
2. Sau khi đã vào dòng lệnh container thực hiện cài đặt các gói thư viện cần thiết và cài đặt Python API PIP theo hướng dẫn [sau đây](https://github.com/tensorflow/serving/blob/master/tensorflow_serving/g3doc/setup.md)
3. Cài đặt gói influxdb để sử dụng chương trình python kết nối đến cơ sở dữ liệu InfluxDB. 
   > pip install influxdb
4. Cài đặt gói requests để gửi requests tới Web UI được bảo mật với HTTPBasicAuth
   > pip install requests
5. Quay trở lại terminer tại thư mục tensorflow-client, thực hiện copy 2 file `autoscaler-client.py` , `run_client.sh` vào trong container:
   > sudo docker cp autoscaler-client.py tf-client-container:/
   > sudo docker cp run_client.sh tf-client-container:/
6. Chuyển lại terminer trên container, cấp quyền chạy cho file `run_client.sh`  với lệnh sau:
   > chmod +x run_client.sh
7. Đóng gói container thành docker image
   > sudo docker commit tf-client-container $USER/tf-serving-client
8. Đẩy lên Docker Hub
   > sudo docker push $USER/tf-serving-client
