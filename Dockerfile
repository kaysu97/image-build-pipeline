ARG  AIRFLOW_IMAGE_TAG=AIRFLOW_IMAGE_TAG
FROM apache/airflow:${AIRFLOW_IMAGE_TAG}
USER root
RUN apt-get update \
  && apt-get install -y lftp \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
USER airflow
RUN pip3 install --no-cache-dir -r requirements.txt