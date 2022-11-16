ARG  AIRFLOW_IMAGE_TAG=AIRFLOW_IMAGE_TAG
FROM apache/airflow:${AIRFLOW_IMAGE_TAG}
USER root
RUN apt-get update \
  && apt-get install -y lftp \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
USER airflow
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt --no-cache-dir
