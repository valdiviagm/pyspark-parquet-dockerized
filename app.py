from pyspark.sql import SparkSession
from pyspark.sql.functions import avg, max, min

def main():
    spark = SparkSession.builder \
        .appName("ParquetReadExample") \
        .config("spark.master", "local") \
        .getOrCreate()

    df = spark.read.parquet("/data/dataset.parquet")
    df.printSchema()
    df.show()

    age_stats = df.select(
        avg("Age").alias("Average Age"),
        max("Age").alias("Maximum Age"),
        min("Age").alias("Minimum Age")
    )
    age_stats.show()

    spark.stop()

if __name__ == "__main__":
    main()
