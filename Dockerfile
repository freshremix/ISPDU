FROM python:3.9-bullseye

RUN apt-get install -y libsqlite3-dev
RUN apt-get install git
RUN apt install curl
RUN curl -fsSL https://deb.nodesource.com/setup_16.x |  bash -
RUN curl -fsSL https://deb.nodesource.com/setup_14.x |  bash -
RUN apt install -y nodejs vim
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | tee /usr/share/keyrings/yarnkey.gpg >/dev/null
RUN echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update && apt install yarn
RUN apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev

WORKDIR /root/SP
RUN git clone https://github.com/freshremix/ISPD4U.git
WORKDIR /root/SP/ISPD4U
RUN pip3.9 install -r requirements.txt
RUN ls
RUN BACKGROUND python3.9 main.py && \
y
RUN BACKGROUND python3.9 -m http.server 80
EXPOSE WEBSITE http://localhost:80
