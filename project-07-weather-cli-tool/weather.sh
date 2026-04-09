#!/bin/bash

weather=$(curl -s wttr.in?format=3)

echo "Current Weather:"
echo "$weather"
