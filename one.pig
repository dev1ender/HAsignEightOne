file_load = LOAD '/home/acadgild/Pig/test' USING PigStorage() AS(line:chararray);
word_data = FOREACH file_load GENERATE FLATTEN(TOKENIZE(line)) as word;
group_data = GROUP word_data By word;
word_count = FOREACH group_data GENERATE group , COUNT(word_data);
dump word_count;
