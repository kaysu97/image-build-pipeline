FROM apache/airflow:2.4.3-python3.7
USER root
RUN apt-get update \
  && apt-get install -y lftp \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
USER airflow
# RUN pip install --no-cache-dir apache-airflow-providers-apache-spark==2.1.3