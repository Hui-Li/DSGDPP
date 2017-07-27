#!/usr/bin/env bash

train_file="/home/hli2/mf_data/netflix/train.mmc"
test_file="/home/hli2/mf_data/netflix/test.mmc"
row_file="/home/hli2/mf_data/netflix/factors/"
col_file="/home/hli2/mf_data/netflix/factors/"

rank="50 100"
loss="Nzsl_Nzl2(0.05)"
decay="Const(0.002)"
epoches="100"
thread_num="1 2 4 8"
log_file="netflix-"

cd ../../build/tools

for d in $rank; do
    for thread in $thread_num; do
        target_row_file=$row_file
        target_row_file+=$d
        target_row_file+="/W.mma"

        target_col_file=$col_file
        target_col_file+=$d
        target_col_file+="/H.mma"

        trace_file=$log_file
        trace_file+=$d
        trace_file+="-1-"
        trace_file+=$thread
        trace_file+="-trace.txt"

        target_log_file=$log_file
        target_log_file+=$d
        target_log_file+="-1-"
        target_log_file+=$thread
        target_log_file+="-log.txt"

        ./mfdsgdpp --tasks-per-rank "$thread" --trace "$trace_file" --rank "$d" --update "$loss" \
        --regularize "None" --loss "$loss" --decay "$decay" --epochs "$epoches" --input-file "$train_file" \
        --input-test-file "$test_file" --input-row-file "$target_row_file" --input-col-file "$target_col_file" > "$target_log_file"

       mv $target_log_file ../../experiments/dsgdpp
       mv $trace_file ../../experiments/dsgdpp

    done
done