#!/bin/bash
ps -u "$(echo $(w -h | cut -d ' ' -f1 | sort -u))" o user= | sort | uniq -c | sort -rn
ps -A o user= | sort | uniq -c | sort -rn
