rmdir logs
mkdir logs
# train
# & is for redirecting errors
python wmseg_main.py --do_train --train_data_path=./sample_data/train.tsv --eval_data_path=./sample_data/test.tsv --use_bert --bert_model=/path/to/bert/model --use_memory --decoder=crf --max_seq_length=300 --max_ngram_size=300 --train_batch_size=2 --eval_batch_size=2 --num_train_epochs=3 --warmup_proportion=0.1 --learning_rate=5e-5 --ngram_num_threshold=2 --patient=10 --ngram_flag=av --av_threshold=2 --model_name=sample_model &> errors.txt
# test
# >> is to append to file
python wmseg_main.py --do_test --eval_data_path=./sample_data/test.tsv --eval_model=./models/model_name/model.pt &>> errors.txt
# predict
python wmseg_main.py --do_predict --input_file=./sample_data/sentence.txt --output_file=./sample_data/sentence.txt.out --eval_model=./models/model_name/model.pt &>> errors.txt