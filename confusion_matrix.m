phones=importdata("/Volumes/zijianf/phones.txt");
mat=load("/Volumes/zijianf/mat_noise.txt");
cor=load("/Volumes/zijianf/cor_noise.txt");
ins=load("/Volumes/zijianf/ins_noise.txt");
del=load("/Volumes/zijianf/del_noise.txt");
d_matrix=mat+diag(cor)+ins+del;
%norm_mtr=d_matrix./total;
%sTable = array2table(d_matrix,'RowNames',phones,...
%    'VariableNames',phones);

figure(1)
norm_mtr_1=d_matrix./sum(d_matrix,2);
heatmap(phones,phones,norm_mtr_1);


mat=load("/Volumes/zijianf/mat_nor.txt");
cor=load("/Volumes/zijianf/cor_nor.txt");
ins=load("/Volumes/zijianf/ins_nor.txt");
del=load("/Volumes/zijianf/del_nor.txt");
d_matrix=mat+diag(cor)+ins+del;
%norm_mtr=d_matrix./total;
%sTable = array2table(d_matrix,'RowNames',phones,...
%    'VariableNames',phones);

figure(2)
norm_mtr_2=d_matrix./sum(d_matrix,2);
heatmap(phones,phones,norm_mtr_2);

diff=norm_mtr_2-norm_mtr_1;
figure(3)
heatmap(phones,phones,log(abs(diff)+1e-8));