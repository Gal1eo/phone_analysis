function distance = compute_dm(child_mean, child_var, adult_mean, adult_var)
d1 = (child_mean-adult_mean).'*child_var*(child_mean-adult_mean);
d2 = (child_mean-adult_mean).'*adult_var*(child_mean-adult_mean);
distance = (d1 + d2) / 2;   
end