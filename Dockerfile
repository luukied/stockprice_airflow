FROM python:3.10-slim

ENV AIRFLOW_HOME=/root/airflow
ENV AIRFLOW_VERSION=2.5.3
ENV PYTHON_VERSION=3.10

COPY airflow.cfg $AIRFLOW_HOME/airflow.cfg

RUN apt-get update \
    && apt-get -y install libpq-dev gcc

RUN export CONSTRAINT_URL="https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt" \
    && pip install --upgrade pip \
    && pip install psycopg2 \
    && pip install "apache-airflow==${AIRFLOW_VERSION}" --constraint "${CONSTRAINT_URL}"

CMD airflow standalone