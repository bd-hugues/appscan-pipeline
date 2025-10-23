FROM ubuntu:latest
ENV PATH="/SAClientUtil/bin:${PATH}"
RUN apt update
RUN apt install -y curl unzip maven openjdk-11-jre gradle jq npm && apt clean
RUN curl https://cloud.appscan.com/api/v4/Tools/SAClientUtil?os=linux > SAClientUtil.zip && unzip SAClientUtil.zip && rm -f SAClientUtil.zip && mv SAClientUtil.* SAClientUtil
COPY scripts /scripts/
