#!/bin/bash

COUNT_UPDATES=$(checkupdates | wc -l)

if [ $COUNT_UPDATES != "0" ]; then
  echo "$COUNT_UPDATES "
fi

