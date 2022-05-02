FROM ubuntu:20.04
RUN apt-get update
RUN ln -fsn /usr/share/zoneinfo/Europe/Moscow /etc/localtime
RUN apt-get install ffmpeg libsm6 libxext6  -y
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
COPY setup.py .

RUN pip install -e .
#RUN apt-get install -y python3-opencv
RUN pip install opencv-python
RUN pip install torch
RUN pip install torchvision

COPY assests ./assests/
COPY semseg ./semseg/
COPY config.yaml .
COPY test.py .
COPY SFNet_18_HELEN_61_0.pth .

ENTRYPOINT ["python3", "test.py"]
