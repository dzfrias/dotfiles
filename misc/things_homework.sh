#!/bin/bash

days=(Monday Tuesday Wednesday Thursday Friday)
for i in {0..4}; do
  when="in%20$i%20days"
  open "things:///add?title=${days[i]}%20homework&checklist-items=%20&when=$when&list=School"
done
