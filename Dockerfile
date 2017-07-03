FROM ubuntu:14.10

RUN sed -i -e 's/archive.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list
RUN apt-get -y update && apt-get -y install fio wget

VOLUME /tmp/fio-data
WORKDIR /tmp/fio-data
COPY iometer-bench.fio /tmp/fio-data/job.fio

CMD ["fio", "job.fio", "--runtime=60", "--size=1g"]
