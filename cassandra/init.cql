create keyspace "jpaExamples" with replication = {
 'class': 'SimpleStrategy',
 'replication_factor': 1
};

use "jpaExamples";

CREATE TABLE "AUTHOR" (
  key text,
  "AGE" varint,
  "AUTHOR_NAME" text,
  "SEX" text,
  PRIMARY KEY ((key))
);

