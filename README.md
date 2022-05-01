# Faces_segmentation_example
Здесь рассмотрен пример запуска репозитория: https://github.com/sithu31296/semantic-segmentation для задачи сегментации частей лица.
Решение использует заранее обученную модель SFNet.
# Требования
* Ubuntu 20.04
* Python 3
* Docker
# Инструкция к запуску теста
1) Клонировать репозиторий
```bash
$ git clone https://github.com/JuliaGurieva/Faces_segmentation_example.git
```
```bash
$ cd Faces_segmentation_example
```
2) Скачать модель
* файл по ссылке https://drive.google.com/drive/folders/1tbke2oezCMdbB33Huco_T6MoAmAljW2X?usp=sharing/SFNet_18_HELEN_61_0.pth поместить в папку checkpoints/pretrained
* файл по ссылке https://drive.google.com/drive/folders/1tbke2oezCMdbB33Huco_T6MoAmAljW2X?usp=sharing/resnetd18.pth поместить в папку checkpoints/backbones
3) Собрать и запустить докер:
```bash
$ docker build -t test .
```
```bash
$ docker run test
```
4) Получить изображения из контейнера
* найти ID контейнера:
```bash
$ docker ps -a
```
Копировать папку с исходными изображениями (faces) и результатами в <your path>:
```bash
$ docker cp <ID>:assests/faces <your path>
$ docker cp <ID>:assests/faces_output <your path>
```
В папке your path/faces хранятся исходные изображения, которые обрабатывались скриптом test.py
В папке your path/faces_output есть папки reference_test_results (получены в моей системе) и test_results (получены при запуске контейнера).
При запуске контейнера, после получения изображений в test results, было проведено сравнение изображений в двух папках.
