function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
temp1 = 0;
temp2 = 0;
grad = zeros(size(theta));
grad1 = zeros(size(theta));
grad2 = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


temp1 = 1/m * ((-y' * log((1 ./ (1 + exp (-X * theta))))) - ((1 - y )' * log(1 - (1 ./ (1 + exp (-X * theta)))))) ;
grad1 = ( 1/m * X' * (1 ./ (1 + exp (-X * theta)) - y ) ) ;
theta(1)=0;
temp2 =lambda * ( sum(theta .^2)) ./ (2*m);
grad2 = (lambda .* theta ) ./ m ;
J = temp1 + temp2
grad = grad1 + grad2
% =============================================================

end