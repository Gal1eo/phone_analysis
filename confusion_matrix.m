phones=importdata("/Volumes/zijianf/clean_noise/phones.txt");
% modeling the noise
mat=load("/Volumes/zijianf/clean_noise/mat_noise.txt");
cor=load("/Volumes/zijianf/clean_noise/cor_noise.txt");
ins=load("/Volumes/zijianf/clean_noise/ins_noise.txt");
del=load("/Volumes/zijianf/clean_noise/del_noise.txt");
d_matrix=mat+diag(cor)+ins+del;
%norm_mtr=d_matrix./total;
%sTable = array2table(d_matrix,'RowNames',phones,...
%    'VariableNames',phones);

figure(1)
norm_mtr_1=d_matrix./sum(d_matrix,2);
heatmap(phones,phones,norm_mtr_1);

% without modeling the noise
mat=load("/Volumes/zijianf/clean_noise/mat_nor.txt");
cor=load("/Volumes/zijianf/clean_noise/cor_nor.txt");
ins=load("/Volumes/zijianf/clean_noise/ins_nor.txt");
del=load("/Volumes/zijianf/clean_noise/del_nor.txt");
d_matrix=mat+diag(cor)+ins+del;
%norm_mtr=d_matrix./total;
%sTable = array2table(d_matrix,'RowNames',phones,...
%    'VariableNames',phones);

figure(2)
norm_mtr_2=d_matrix./sum(d_matrix,2);
heatmap(phones,phones,norm_mtr_2);
dig_b = diag(norm_mtr_2);

% adult phone confusion matrix
mat=load("/Volumes/zijianf/clean_noise/mat_tim.txt");
cor=load("/Volumes/zijianf/clean_noise/cor_tim.txt");
ins=load("/Volumes/zijianf/clean_noise/ins_tim.txt");
del=load("/Volumes/zijianf/clean_noise/del_tim.txt");
d_matrix=mat+diag(cor)+ins+del;
figure(3)
norm_mtr_2=d_matrix./sum(d_matrix,2);
heatmap(phones,phones,norm_mtr_2);

%diff=norm_mtr_2-norm_mtr_1;
%figure(3)
%heatmap(phones,phones,log(abs(diff)+1e-8));