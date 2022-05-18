mat=load("/Volumes/zijianf/mat.txt");
cor=load("/Volumes/zijianf/cor.txt");
d_matrix=mat+diag(cor);
phones=importdata("/Volumes/zijianf/phones.txt");
sTable = array2table(d_matrix,'RowNames',phones,...
    'VariableNames',phones);

norm_mtr=d_matrix./sum(d_matrix,2);
heatmap(phones,phones,norm_mtr);