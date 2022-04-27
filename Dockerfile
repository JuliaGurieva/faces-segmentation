FROM ubuntu:20.04
RUN apt-get update
#RUN apt-get install ffmpeg libsm6 libxext6  -y
RUN ln -fsn /usr/share/zoneinfo/Europe/Moscow /etc/localtime
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN apt-get install -y python3-opencv
#RUN pip install opencv-python
RUN apt-get install -y git
RUN apt-get install -y wget
#RUN apt-get install git
#RUN pip install tqdm
#RUN pip install numpy scipy matplotlib
#RUN pip install tabulate tensorboard einops
#opencv-python 
#RUN pip install fvcore
RUN pip install torch
RUN pip install torchvision
#RUN git clone https://github.com/sithu31296/semantic-segmentation.git
WORKDIR /.
RUN pip install -e .
ADD faces.tar.gz /.assests/
RUN mkdir /.checkpoints
RUN mkdir /.checkpoints/backbones
RUN mkdir /.checkpoints/pretrained
RUN mkdir /.assests/faces_output
ADD reference_test_results.tar.gz /.assests/faces_output/
#COPY resnetd18.pth /.semantic-segmentation/checkpoints/backbones/
RUN wget https://drive.google.com/drive/folders/1tbke2oezCMdbB33Huco_T6MoAmAljW2X?usp=sharing/resnetd18.pth -P /.checkpoints/backbones/
#COPY SFNet_18_HELEN_61_0.pth /.checkpoints/checkpoints/
RUN wget https://drive.google.com/drive/folders/1tbke2oezCMdbB33Huco_T6MoAmAljW2X?usp=sharing/SFNet_18_HELEN_61_0.pth -P /.checkpoints/checkpoints/
COPY config.yaml .
COPY test.py .
CMD ["python3", "test.py"]



