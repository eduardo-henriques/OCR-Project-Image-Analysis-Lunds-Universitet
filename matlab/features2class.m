function y = features2class(x, classification_data)
% Nearest Neighbour
Y_train = classification_data{2};
X_train = classification_data{1};
% Take the distance between new data point and training data point

n_neighbor = 3;
distance = sum((X_train - x).^2);
[dsort, order] = sort(distance);
% Find the closest data point and its category
%[~, index] = min(distance,[],'all')
classes = Y_train(order(1:n_neighbor));
y = median(classes);
end
