# Use an official OpenJDK runtime as a parent image
FROM openjdk:11-jre-slim

# Install wget, Python, and pip
RUN apt-get update && \
    apt-get install -y wget python3 python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables for Spark and Hadoop versions
ENV SPARK_VERSION=3.1.1 \
    HADOOP_VERSION=3.2

# Download and install Spark
RUN cd /tmp && \
    wget -q "https://archive.apache.org/dist/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop$HADOOP_VERSION.tgz" && \
    tar xzf "spark-$SPARK_VERSION-bin-hadoop$HADOOP_VERSION.tgz" -C /usr/local --owner root --group root --no-same-owner && \
    rm "spark-$SPARK_VERSION-bin-hadoop$HADOOP_VERSION.tgz"

# Define environment variables for Spark
ENV SPARK_HOME=/usr/local/spark-$SPARK_VERSION-bin-hadoop$HADOOP_VERSION
ENV PATH=$PATH:$SPARK_HOME/bin

# Install PySpark
RUN pip3 install pyspark

# Copy the Python script
COPY app.py /app.py

# Command to run the script
CMD ["spark-submit", "/app.py"]

