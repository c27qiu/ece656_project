# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster

WORKDIR /app

COPY ./src/requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY ./src .

CMD ["python3", "gdm_fe.py" , "--port=8080", "--host=0.0.0.0" ]
EXPOSE 8080