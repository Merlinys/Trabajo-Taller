FROM mysql/mysql-server:8.0
COPY ./init_db.sh /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/init_db.sh

FROM  python:3.8
ENV PYTHONUNBUFFERED 1
WORKDIR /app
COPY requeriments.txt /app/
RUN pip install -r requeriments.txt
COPY . /app/