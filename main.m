% Load the necessary files
adult=load("adult_matrix.mat");
child=load("child_matrix.mat");
Z = cell2struct(cellfun(@vertcat,struct2cell(adult),struct2cell(child),'uni',0),fieldnames(adult),1);

adult_mean = adult.mean; % 38 * 13
child_mean = child.mean; % 38 * 13
adult_cov  = adult.cov;  % 38 * 13 * 13
child_cov  = child.cov;  % 38 * 13 * 13
d_matrix = zeros(76, 76);

for l=1:1:76
    for m=1:1:76
        d_matrix(l,m)=compute_dt(Z.mean(l,:),squeeze(Z.cov(l,:,:)), ...
            Z.mean(m,:), squeeze(Z.cov(m,:,:)));
    end
end

a= convertCharToCell(Z.phones);
sTable = array2table(d_matrix,'RowNames',a,...
    'VariableNames',a);