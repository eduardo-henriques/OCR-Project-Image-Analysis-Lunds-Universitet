function features = segment2features(I)
clc;
close all;
[rows, columns] = size(I);
props = regionprops("table",I,"all");

%% Get the center of the image
C = [columns rows]/2;

%% Calculates the center of mass of the region
x_center = props.Centroid(1);
y_center = props.Centroid(2);

%% Put the center of mass in the origin
J = imtranslate(I,C - [x_center,y_center]);

%% Exctracting features

image_std = std2(J);
image_mean = mean(J,'all');
image_moment = moment(J,2,'all');
image_skewness = skewness(J,1,'all');

perimImage = bwperim(J);
numPerimeterPixels = sum(perimImage(:));

Icropped = imcrop(J, [62 2.5 16 24]);
Iresized = imresize(Icropped,[16 16]);
Ireshape = reshape(Iresized,1,[]);
% Ireshape_feature = Ireshape/max(Ireshape,[],'all');


pre_features = [Ireshape, numPerimeterPixels, image_std, image_moment, image_mean, image_skewness]';
features = pre_features/max(pre_features,[],'all');

