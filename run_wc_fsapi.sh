LIBJARS="/home/vicente/.m2/repository/org/dicl/velox/velox-hadoop/1.0/velox-hadoop-1.0.jar"
OPTS="-D velox.recordreader.buffersize=8388608"
OPTS+=" -D mapreduce.map.speculative=false"

echo $OPTS

time hadoop jar $LIBJARS wordcount $OPTS -libjars $LIBJARS /text_100GB.dat /output.`date +%N`
