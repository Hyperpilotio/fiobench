FROM ubuntu:14.10

RUN sed -i -e 's/archive.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list
RUN apt-get -y update && apt-get -y install fio wget

VOLUME /tmp/fio-data
WORKDIR /tmp/fio-data
ADD iometer-bench.fio /tmp/fio-data/job.fio

ENTRYPOINT ["fio"]
CMD ["job.fio", "--runtime=60", "--size=1g"]
