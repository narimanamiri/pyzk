#!/bin/bash
cat ./faketime9.py | tail -n 19 | head -n 1 > ./temp
#echo $(sed -i "s/$(cat ./temp | cut -d ' ' -f 12 | cut -d '(' -f 2 | cut -d ',' -f 2)/$min/g" ./temp)
#echo $(sed -i "s/$(cat ./temp | cut -d ' ' -f 12 | cut -d '(' -f 2 | cut -d ',' -f 1)/$hour/g" ./temp)
minh=7
maxh=8

hour=$(( minh + RANDOM % (maxh - minh + 1) ))

minm=11
maxm=55

min=$(( minm + RANDOM % (maxm - minm + 1) ))
echo $(sed -i "s/$(cat ./temp | cut -d ' ' -f 12 | cut -d '(' -f 2 | cut -d ',' -f 2)/$min/g" ./temp)
echo $(sed -i "s/$(cat ./temp | cut -d ' ' -f 12 | cut -d '(' -f 2 | cut -d ',' -f 1)/$hour/g" ./temp)

echo $(sed -i "s/$(cat ./faketime9.py | tail -n 19 | head -n 1)/$(cat ./temp)/g" ./faketime9.py)
echo $(sed -i "s/$(cat ./faketime9.py | tail -n 19 | head -n 1)/$(cat ./temp)/g" ./faketime9.py)
echo "Random number: $hour"

echo "Random number: $min"
python3 ./faketime9.py
sleep 10s
python3 ./realtime9.py

rm -rf ./temp
