OPTS=" -D mapreduce.map.speculative=true"
OPTS+=" -D mapred.map.tasks=3"

run() {
  hadoop org.apache.hadoop.examples.ExampleDriver aggregatewordcount $OPTS /text_100GB_rep3.dat /output.`date +%N` 1 textinputformat &
  hadoop org.apache.hadoop.examples.ExampleDriver wordcount $OPTS /text_100GB_a_rep3.dat /output.`date +%N` &
  hadoop jar ~/opt/hadoop-2.7.3/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.3.jar grep $OPTS /text_100GB_b_rep3.dat /output.`date +%N` "Hey" &
  wait
}

time run
