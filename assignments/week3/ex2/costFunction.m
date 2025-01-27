function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%

% calculation using vectorization (for all x(i) simultaneously) 
%J 
z = X * theta; % m x 1 
h = sigmoid(z); % m x 1
minuendLog = log(h);
minuend = y .* minuendLog; 
subtrahendLog = log(1 - h);
subtrahend = (1 - y) .* subtrahendLog;
diff = -minuend - subtrahend; % m x 1
J = (1 / m) * sum(diff);

%grad
diffGrad = h - y;
product = diffGrad .* X; %m x n+1
total = sum(product, 1); % 1 x n+1
total = total'; % n+1 x 1
grad = (1 / m) * total;

% =============================================================

end
