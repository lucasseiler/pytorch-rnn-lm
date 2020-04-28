#! /bin/bash

scripts=`dirname "$0"`
base=$(realpath $scripts/..)

models=$base/models
data=$base/data
tools=$base/tools
samples=$base/samples

mkdir -p $samples

num_threads=4
device=""

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python3 generate.py \
        --data $data/friends_clean \
        --words 300 \
        --checkpoint $models/model045.pt \
        --outf $samples/sample045.txt \
        --strategy sampling
)
