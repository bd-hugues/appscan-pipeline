FROM ubuntu:latest
ENV PATH="/SAClientUtil/bin:${PATH}"
RUN apt update
RUN apt install -y curl unzip maven openjdk-11-jre gradle && apt clean
RUN curl https://cloud.appscan.com/api/v4/Tools/SAClientUtil?os=linux > SAClientUtil.zip
RUN unzip SAClientUtil.zip
RUN rm -f SAClientUtil.zip
RUN mv SAClientUtil.* SAClientUtil
