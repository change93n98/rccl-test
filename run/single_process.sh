#!/bin/bash

source ./env.sh
APP="../build/all_reduce_perf --minbytes=262144000 --maxbytes=262144000 --parallel_init=0 --warmup_iters=1 --stepfactor=2 --iters=10"
local_rank=$OMPI_COMM_WORLD_LOCAL_RANK

case ${local_rank} in
[0])
echo numactl --cpunodebind=0 --membind=0 ${APP}
numactl --cpunodebind=${1} ${APP}
;;
[1])
echo numactl --cpunodebind=0 --membind=0 ${APP}
numactl --cpunodebind=${1} ${APP} ;;
[2])
echo numactl --cpunodebind=0 --membind=0 ${APP}
numactl --cpunodebind=${1} ${APP}
;;
[3])
echo numactl --cpunodebind=0 --membind=0 ${APP}
numactl --cpunodebind=${1} ${APP}
;;
[4])
echo numactl --cpunodebind=4 --membind=4 ${APP}
numactl --cpunodebind=${2} ${APP}
;;
[5])
echo numactl --cpunodebind=4 --membind=4 ${APP}
numactl --cpunodebind=${2} ${APP}
;;
[6])
echo numactl --cpunodebind=4 --membind=4 ${APP}
numactl --cpunodebind=${2} ${APP}
;;
[7])
echo numactl --cpunodebind=4 --membind=4 ${APP}
numactl --cpunodebind=${2} ${APP}
;;
esac
