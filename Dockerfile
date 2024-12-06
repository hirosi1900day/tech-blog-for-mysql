FROM mysql:8.0.36

ENV MYSQL_DATABASE=testdb
ENV MYSQL_ROOT_PASSWORD=your_password

COPY ./sql-scripts/ /docker-entrypoint-initdb.d/

