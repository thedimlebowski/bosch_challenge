#!/bin/bash

# Subsample
head -1 data/train_categorical.csv > data/train_categorical_sub.csv
gshuf -n$1 data/train_categorical.csv >> data/train_categorical_sub.csv

head -1 data/train_date.csv > data/train_date_sub.csv
gshuf -n$1 data/train_date.csv >> data/train_date_sub.csv

head -1 data/train_numeric.csv > data/train_numeric_sub.csv
gshuf -n$1 data/train_numeric.csv >> data/train_numeric_sub.csv

# Train
cut -d, -f2- data/train_date_sub.csv > data/train_date_sub_temp.csv
cut -d, -f2-969 data/train_numeric_sub.csv > data/train_numeric_sub_temp.csv
paste -d, data/train_categorical_sub.csv data/train_date_sub_temp.csv data/train_numeric_sub_temp.csv > data/X_train_sub.csv

# Remove temp files
rm data/train_date_sub_temp.csv
rm data/train_numeric_sub_temp.csv

# Target
cut -d, -f1,970 data/train_numeric_sub.csv > data/Y_train_sub.csv
