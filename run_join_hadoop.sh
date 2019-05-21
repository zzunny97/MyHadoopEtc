OPTS=" -D mapreduce.map.speculative=true"

time hadoop org.apache.hadoop.examples.ExampleDriver join $OPTS /text_100GB_rep3.dat /output.`date +%N`
