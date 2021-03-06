#! /bin/bash

scripts=`dirname "$0"`
base=$(realpath $scripts/..)

models=$base/models
data=$base/data
tools=$base/tools

mkdir -p $models

num_threads=4
device=""

SECONDS=0

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python3 main.py --data $data/friends_clean \
        --epochs 40 \
        --emsize 200 --nhid 200 --dropout 0.45 --tied \
        --save $models/model045.pt
)

echo "time taken:"
echo "$SECONDS seconds"
