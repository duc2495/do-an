# Hướng dẫn train RNN model
## Điều kiện tiên quyết
Trước khi train model yêu cầu đã cài đặt [Tensorflow](https://www.tensorflow.org/install/), và [python3](http://docs.python-guide.org/en/latest/starting/install3/linux/)
## Tải mã nguồn từ github 
Mở Terminer lên và chạy lệnh sau:
> git clone https://github.com/duc2495/do-an.git 

Sau khi tải về thành công, truy cập vào thư mục `do-an/tensorflow-client` với lệnh sau:
> cd do-an/ProactiveAutoscaler/train-model
## Train model
Yêu cầu thay đổi địa chỉ thư mục lưu kết quả trong file `CPU_utility.py`. Có thể train model với số lần lặp tùy ý với tham số dòng lệnh `--num_epochs`. Ví dụ thực hiện train model với 150 lần lặp.
> python3 CPU_utility.py --num_epochs 150
