FROM ubuntu
USER root
WORKDIR ./app
COPY . .
RUN apt-get update -qq
RUN apt-get install -qqy software-properties-common  python3 python3-pip
RUN pip3 install -r requirements.txt
RUN python3 manage.py makemigrations
RUN python3 manage.py migrate
ENTRYPOINT python3 manage.py runserver 0.0.0.0:8000