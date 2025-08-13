from pyspark.sql import SparkSession

if __name__ == "__main__":
    spark = SparkSession.builder.appName("WordCountTest").getOrCreate()
    data = ["hello world", "hello spark", "hello docker"]
    rdd = spark.sparkContext.parallelize(data)
    word_counts = rdd.flatMap(lambda line: line.split(" ")) \
                    .map(lambda word: (word, 1)) \
                    .reduceByKey(lambda a, b: a + b)
    for word, count in word_counts.collect():
        print(f"{word}: {count}")
    spark.stop()
