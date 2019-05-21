THRESHOLD=`grep -Po '_split" : "\K\d.\d\d' ~/.eclipse.json`
LIBJARS="/home/vicente/.m2/repository/org/dicl/velox/velox-hadoop/1.0/velox-hadoop-1.0.jar"
OPTS="-D velox.recordreader.buffersize=8388608"
OPTS+=" -D mapreduce.map.speculative=false"
OPTS+=" -D velox.profileToHDFS=false"
OPTS+=" -D velox.numChunks=6401"
OPTS+=" -D velox.input_threshold=$THRESHOLD"
OPTS+=" -D mapred.map.tasks=3"

echo $OPTS

run() {
  hadoop jar $LIBJARS LeanAggregateWordCount $OPTS -D velox.inputfile=/text_100GB.dat -libjars $LIBJARS /text_100GB.dat /output.`date +%N` & 
  hadoop jar $LIBJARS leanwordcount $OPTS -D velox.inputfile=text_a_100GB.dat -libjars $LIBJARS text_a_100GB.dat /output.`date +%N` &
  hadoop jar $LIBJARS leangrep $OPTS -D velox.inputfile=text_c_100GB.dat -libjars $LIBJARS text_c_100GB.dat /output.`date +%N` "Hey" &
  wait
}

time run
