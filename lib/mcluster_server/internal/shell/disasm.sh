#!/bin/bash

mcluster_curr_tmp_resv=$RANDOM
echo $1 >> /tmp/mcluster_$mcluster_curr_tmp_resv
ndisasm /tmp/mcluster_$mcluster_curr_tmp_resv
rm -rf /tmp/mcluster/mcluster_$mcluster_curr_tmp_resv

