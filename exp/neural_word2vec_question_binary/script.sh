#!/bin/bash
batch=16
expdir=exp/neural_word2vec_question_binary
learning_rate=0.002
num_layers=3
num_units=64
smoothing_parameter=0.001
weight_decay=0
word_embeddings=dataset/word2vec.txt
date
python -u code/train.py --datadir dataset/ --batch $batch --expdir $expdir --epochs 500 --learning_rate $learning_rate --word_embeddings $word_embeddings --num_layers $num_layers --num_units $num_units --smoothing_parameter $smoothing_parameter --weight_decay $weight_decay
date
