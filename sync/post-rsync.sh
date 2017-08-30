#!/usr/bin/env bash

DIR='/usr/local/hadoop/etc /usr/local/spark/conf /usr/local/hbase/conf'

for slave in $(cat slaves.txt); do
    rsync -avz $HOME/.bashrc   "root@$slave":$HOME/.bashrc
    rsync -avz $HOME/bin       "root@$slave":$HOME
    rsync -avz /etc/hosts      "root@$slave":/etc

    for dir in $DIR; do
        rsync -avz $dir "root@$slave":/usr/local
    done
done
