FROM ubuntu:20.04
RUN apt-get update
#RUN apt-get install ffmpeg libsm6 libxext6  -y
#RUN ln -fsn /usr/share/zoneinfo/Europe/Moscow /etc/localtime
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN apt-get install -y git
COPY setup.py .

RUN pip install -e .
RUN apt-get install -y python3-opencv
RUN pip install torch
RUN pip install torchvision
COPY assests ./assests/
COPY semseg ./semseg/
COPY checkpoints ./checkpoints/
COPY config.yaml .
COPY test.py .
ENTRYPOINT ["python3", "test.py"]
