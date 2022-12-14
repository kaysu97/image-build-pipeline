ARG  AIRFLOW_IMAGE_TAG=AIRFLOW_IMAGE_TAG
FROM apache/airflow:${AIRFLOW_IMAGE_TAG}
USER root
RUN apt-get update \
  && apt-get install -y libldap2-dev libsasl2-dev libspatialindex-dev \
     gcc g++ vim slapd ldap-utils tox lcov valgrind libspatialindex6 libspatialindex-c6 python3-dev libpq-dev lftp \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
USER airflow
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt --no-cache-dir
