THRESHOLD=`grep -Po '_split" : "\K\d.\d\d' ~/.eclipse.json`
LIBJARS="/home/vicente/.m2/repository/org/dicl/velox/velox-hadoop/1.0/velox-hadoop-1.0.jar"
OPTS="-D velox.recordreader.buffersize=8388608"
OPTS+=" -D mapreduce.map.speculative=false"
OPTS+=" -D velox.inputfile=/text_100GB.dat"
OPTS+=" -D velox.profileToHDFS=false"
OPTS+=" -D velox.numChunks=6401"
OPTS+=" -D velox.input_threshold=$THRESHOLD"

time hadoop jar $LIBJARS leangrep $OPTS -libjars $LIBJARS /text_100GB.dat /output.`date +%N` "Hey"
