function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

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

% J ���
[a b] = size(X);
HX = X * theta;
n = size(theta);



for i = 1:m
  J = J + ( (-1)*y(i)*log(sigmoid(HX(i))) - (1-y(i))*log(1-sigmoid(HX(i))));
end

for j = 2:n
  J = J + lambda/2*(theta(j)^2);
end
 
J = J / m;

% grad ���

for j= 1:n
  for i = 1:m
    grad(j) = grad(j) + (sigmoid(HX(i))-y(i))*X(i,j);
  end
  if (j>1)
    grad(j) = grad(j) + lambda*theta(j);
  endif
end

grad = grad ./ m;






% =============================================================

end
