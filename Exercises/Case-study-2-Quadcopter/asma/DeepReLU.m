function [W1, W2, W3, W4] = DeepReLU(W1, W2, W3, W4, X, D) 

alpha = 0.15;

N = 5001; 

for k = 1:N 
x = X(:, k); 
v1 = W1*x; 
y1 = Tanh(v1);
% y1 = y1 .* Dropout(y1, 0.1); 
v2 = W2*y1; 
y2 = Tanh(v2); 
 y2 = y2 .* Dropout(y2, 0.1); 
v3 = W3*y2; 
y3 = Tanh(v3);
% y3 = y3 .* Dropout(y3, 0.1); 
v = W4*y3; 
y = Tanh(v); 
%y = purelin(v);
% d = D(k, :)'; 
d= D(:, k);
e = d - y; 
delta = (1+y).*(1-y).*e; 
%delta = e; 
e3 = W4'*delta; 
delta3 = (1+y3).*(1-y3).*e3; 
e2 = W3'*delta3; 
delta2 = (1+y2).*(1-y2).*e2; 
e1 = W2'*delta2; 
delta1 = (1+y1).*(1-y1).*e1; 
dW4 = alpha*delta*y3'; 
W4 = W4 + dW4; 
dW3 = alpha*delta3*y2';
W3 = W3 + dW3; 
dW2 = alpha*delta2*y1'; 
W2 = W2 + dW2; 
dW1 = alpha*delta1*x'; 
W1 = W1 + dW1; 
end
end
