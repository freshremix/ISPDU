FROM python:3.9-bullseye

RUN sudo apt-get install -y libsqlite3-dev
RUN sudo apt-get install git
RUN sudo apt install curl
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | sudo bash -
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | sudo bash -
RUN sudo apt install -y nodejs vim
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
RUN echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN sudo apt update && sudo apt install yarn
RUN sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev

RUN wget https://www.python.org/ftp/python/3.11.2/Python-3.11.2.tgz
RUN tar -xf Python-3.11.2.tgz
WORKDIR Python-3.11.2
RUN apt-get install -y pkg-config
RUN ./configure --enable-optimizations
RUN make -j 6
RUN sudo make altinstall
RUN python3.11 -m pip install --upgrade pip
WORKDIR /root/SP
RUN git clone https://github.com/freshremix/ISPD4U.git
WORKDIR /root/SP/ISPD4U
RUN pip3.11 install -r requirements.txt
RUN ls
RUN BACKGROUND python3.11 main.py && \
y
RUN BACKGROUND python3.11 -m http.server 80
EXPOSE WEBSITE http://localhost:80
