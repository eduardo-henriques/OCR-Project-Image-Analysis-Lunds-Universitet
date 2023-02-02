function S = im2segment(im)
% S = im2segment(im)

nrofsegments = 5;
S = cell(1,nrofsegments);
J = medfilt2(im);
BW = J > 21;
cc = bwconncomp(BW,4); % Creating default connected components
stats = regionprops(cc,"Area"); % Passing to regionprops those components
idx = find([stats.Area] > 10); % Fitting regions that meet certain criteria
BW2 = ismember(labelmatrix(cc),idx); % Creating a binary image containing those regions

L = bwlabel(BW2,8); % Create the label matrix 8-connected

for kk = 1:nrofsegments
   S{kk}= L ==kk;
end