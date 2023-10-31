phones=importdata("/Volumes/zijianf/clean_noise/uphones.txt");

base_cmu=load("/Volumes/zijianf/clean_noise/base_cmu_ce.mat").Confusion_matrix;
large_cmu=load("/Volumes/zijianf/clean_noise/large_cmu_ce.mat").Confusion_matrix;
base_lbi=load("/Volumes/zijianf/clean_noise/base_lbi_ce.mat").Confusion_matrix;
large_lbi=load("/Volumes/zijianf/clean_noise/large_lbi_ce.mat").Confusion_matrix;

%% Confusion Matrix plot
figure_count = 1;
figure(figure_count);
figure_count = figure_count+1;
norm_mtr_1=double(base_cmu)./sum(base_cmu,2);
heatmap(phones,phones,norm_mtr_1);


figure(figure_count);
figure_count = figure_count+1;
norm_mtr_2=double(large_cmu)./sum(large_cmu,2);
heatmap(phones,phones,norm_mtr_2);


figure(figure_count);
figure_count = figure_count+1;
norm_mtr_3=double(base_lbi)./sum(base_lbi,2);
heatmap(phones,phones,norm_mtr_3,'ColorLimits',[0 1]);


figure(figure_count);
figure_count = figure_count+1;
norm_mtr_4 = double(large_lbi)./sum(large_lbi,2);
heatmap(phones,phones,norm_mtr_4);



%% sorted barplot
[out, idx] = sort(diag(norm_mtr_1));
fname = phones(idx); 
x = [1:39]; y = out;
figure(figure_count);
figure_count = figure_count+1;
bar(x,y)
set(gca, 'XTick', 1:length(fname),'XTickLabel',fname);

[out, idx] = sort(diag(norm_mtr_2));,
fname = phones(idx); 
x = [1:39]; y = out;
figure(figure_count);
figure_count = figure_count+1;
bar(x,y)
set(gca, 'XTick', 1:length(fname),'XTickLabel',fname);

[out, idx] = sort(diag(norm_mtr_3));
fname = phones(idx); 
x = [1:39]; y = out;
figure(figure_count);
figure_count = figure_count+1;
bar(x,y)
set(gca, 'XTick', 1:length(fname),'XTickLabel',fname);

[out, idx] = sort(diag(norm_mtr_4));
fname = phones(idx); 
x = [1:39]; y = out;
figure(figure_count);
figure_count = figure_count+1;
bar(x,y)
set(gca, 'XTick', 1:length(fname),'XTickLabel',fname);

[out, idx] = sort(diag(norm_mtr_2) - diag(norm_mtr_1));
fname = phones(idx); 
x = [1:39]; y = out;
figure(figure_count);
figure_count = figure_count+1;
bar(x,y)
set(gca, 'XTick', 1:length(fname),'XTickLabel',fname);

[out, idx] = sort(diag(norm_mtr_4) - diag(norm_mtr_3));
fname = phones(idx); 
x = 1:39; y = out;
figure(figure_count);
figure_count = figure_count+1;
bar(x,y)
set(gca, 'XTick', 1:length(fname),'XTickLabel',fname);

%% CMU CTC results
large_cmu_ctc = load("/Volumes/zijianf/clean_noise/large_cmu_ctc.mat");
norm_mtr_5=double(large_cmu_ctc.Confusion_matrix)./sum(large_cmu_ctc.Confusion_matrix + diag(large_cmu_ctc.Insertion) + diag(large_cmu_ctc.Deletion),2);
figure(figure_count);
figure_count = figure_count+1;
heatmap(phones,phones,norm_mtr_5);

[out, idx] = sort(diag(norm_mtr_5));
fname = phones(idx); 
x = [1:39]; y = out;
figure(figure_count);
figure_count = figure_count+1;
bar(x,y)
set(gca, 'XTick', 1:length(fname),'XTickLabel',fname);
