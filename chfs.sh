#!/bin/bash

if [ "$1" == "velox" ] ; then
  cp core-site.xml.velox core-site.xml
elif [ "$1" == "hadoop" ] ; then
  cp core-site.xml.hadoop core-site.xml
fi
