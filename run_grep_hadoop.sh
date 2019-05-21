OPTS=" -D mapreduce.map.speculative=true"
time hadoop jar ~/opt/hadoop-2.7.3/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.3.jar grep $OPTS /text_100GB_b_rep3.dat /output.`date +%N` "Hey"
