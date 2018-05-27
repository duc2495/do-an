# Hướng dẫn đóng gói Tensorflow Serving với docker image
## Điều kiện tiên quyết
Trước khi đóng gói ứng dụng yêu cầu đã cài đặt [Docker](https://docs.docker.com/install/). 
## Tải mã nguồn từ github 
Mở Terminer lên và chạy lệnh sau:
> git clone https://github.com/duc2495/do-an.git 

Sau khi tải về thành công, truy cập vào thư mục `do-an/tensorflow-client` với lệnh sau:
> cd do-an/ProactiveAutoscaler/tensorflow-serving

## Đóng gói Tensorflow Serving
1. Mở 1 Terminer khác chạy một container với ubuntu image
   > sudo docker run -it --name tf-serving-container ubuntu:16.04 bash 
2. Sau khi đã vào dòng lệnh container thực hiện cài đặt các gói thư viện cần thiết và cài đặt `tensorflow-model-server` bằng `apt-get` theo hướng dẫn [sau đây](https://github.com/tensorflow/serving/blob/master/tensorflow_serving/g3doc/setup.md)
3. Quay trở lại Terminer tại thư mục `tensorflow-serving`, 
    Thực hiện copy thư mục cpu_model/ vào trong container
   > sudo docker cp cpu_model/ tf-serving-container:/tmp/
 
   Thực hiện copy file run_server.sh vào trong container
   > sudo docker cp run_server.sh tf-serving-container:/
5. Chuyển lại Terminer trên container, cấp quyền chạy cho file `run_server.sh`
   > chmod +x run_server.sh
6. Đóng gói container thành docker image
   > sudo docker commit tf-serving-container $USER/tf-serving-server
7. Đẩy lên Docker Hub
   > sudo docker push $USER/tf-serving-server
