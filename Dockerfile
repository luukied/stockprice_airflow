FROM apache/airflow:slim-2.6.0-python3.10

USER root
RUN apt-get update \
    && apt-get -y install libpq-dev gcc

USER airflow   
RUN pip install psycopg2 \
    && pip install apache-airflow-providers-cncf-kubernetes