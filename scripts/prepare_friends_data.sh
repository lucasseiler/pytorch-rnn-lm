#! /bin/bash

scripts=`dirname "$0"`
base=$scripts/..

data=$base/data

mkdir -p $data/friends_clean

# preprocess slightly

cat $data/raw/friends.txt | python3 ./scripts/preprocess_raw.py > $data/raw/friends.cleaned.txt

# tokenize, fix vocabulary upper bound

cat $data/raw/friends.cleaned.txt | python3 ./scripts/preprocess.py --vocab-size 5000 --tokenize --lang "en" > \
    $data/raw/friends.preprocessed.txt

# split into train, valid and test

head -n 500 $data/raw/friends.preprocessed.txt > $data//friends_clean/valid.txt
head -n 1000 $data/raw/friends.preprocessed.txt | tail -n 500 > $data/friends_clean/test.txt
tail -n 7000 $data/raw/friends.preprocessed.txt > $data/friends_clean/train.txt
