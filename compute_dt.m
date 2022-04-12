function distance = compute_dm(child_mean, child_var, adult_mean, adult_var)
mfcc_mean = (child_mean-adult_mean);

d1 = mfcc_mean*inv(child_var)*(mfcc_mean.');
d2 = mfcc_mean*inv(adult_var)*(mfcc_mean.');
distance = (d1 + d2) / 2;   
end