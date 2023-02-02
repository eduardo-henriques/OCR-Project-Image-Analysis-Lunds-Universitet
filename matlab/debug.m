close all;
clc;

f = zeros(5,100);
for kk = 1:5
    f(:,kk)=segment2features(S{kk});
end


for kk =1:1
       y(1,1) = features2class(f(:,1),classification_data);
end