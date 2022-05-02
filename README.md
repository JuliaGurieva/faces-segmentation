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
 git clone https://github.com/JuliaGurieva/faces-segmentation.git
```
```bash
 cd faces-segmentation
```
2) Скачать модель
* файл по ссылке https://drive.google.com/drive/folders/1tbke2oezCMdbB33Huco_T6MoAmAljW2X?usp=sharing/SFNet_18_HELEN_61_0.pth поместить в папку c проектом
3) Собрать и запустить докер:
```bash
docker build -t test .
```
```bash
docker run test
```
4) Получить изображения из контейнера
* найти ID контейнера:
```bash
docker ps -a
```
Копировать папку с исходными изображениями (faces) и результатами в your_path:
```bash
docker cp ID:assests/faces your_path
docker cp ID:assests/test_results your_path
docker cp ID:assests/reference_test_results your_path
```
* В папке your_path/faces хранятся исходные изображения, которые обрабатывались скриптом test.py
* В your_path/reference_test_results - результаты, полученные в моей системе
* В your_path/test_results - результаты, полученные при запуске контейнера.
При запуске контейнера получены изображения в test_results, и проведено сравнение изображений в двух папках.
