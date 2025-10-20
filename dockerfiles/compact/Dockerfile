FROM alpine:latest
ENV PATH="/SAClientUtil/bin:/jdk-25/bin${PATH}"
ENV JAVA_HOME="/jdk-25"
RUN apk add --no-cache curl
RUN apk add --no-cache unzip 
RUN apk add --no-cache tar 
RUN curl https://download.java.net/java/GA/jdk25/bd75d5f9689641da8e1daabeccb5528b/36/GPL/openjdk-25_linux-x64_bin.tar.gz > openjdk-25_linux-x64_bin.tar.gz
RUN tar -xvzf openjdk-25_linux-x64_bin.tar.gz
RUN rm openjdk-25_linux-x64_bin.tar.gz
RUN curl https://cloud.appscan.com/api/v4/Tools/SAClientUtil?os=linux > SAClientUtil.zip
RUN unzip SAClientUtil.zip
RUN rm -f SAClientUtil.zip
RUN mv SAClientUtil.* SAClientUtil
