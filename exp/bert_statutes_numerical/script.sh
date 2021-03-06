#!/bin/bash
batch=4
update_period=4
expdir=exp/bert_statutes_numerical
warmup=0.7
learning_rate=5e-06
date
CUDA_VISIBLE_DEVICES=`free-gpu` python -u code/train.py --datadir dataset/ --batch $batch --max_length 512 --gpu --expdir $expdir --epochs 100 --warmup $warmup --learning_rate $learning_rate --update_period $update_period --statutes
date
