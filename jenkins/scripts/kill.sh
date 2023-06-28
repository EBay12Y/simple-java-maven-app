#!/bin/bash

PID=$(pgrep -f "java-maven-app.jar")

if [ -n "$PID" ]; then
  echo "Menghentikan aplikasi dengan PID: $PID"
  
  kill "$PID"
else
  echo "Tidak ada aplikasi yang berjalan"
fi
