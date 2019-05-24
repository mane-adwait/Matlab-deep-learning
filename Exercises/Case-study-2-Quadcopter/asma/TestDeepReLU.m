clear all

load('Ia.mat')
load('Ta.mat')

% load('Ian.mat')
% load('Tan.mat')

O = zeros(5001,3);


X = [Ia(1,:); Ia(2,:); Ia(3,:)];
D = [Ta(1,:); Ta(2,:); Ta(3,:)];


% X(:, 1) = Ia(:,1);
% X(:, 2) = Ia(:,2);
% X(:, 3) = Ia(:,3);

% D(:, 1) = Ta(:,1);
% D(:, 2) = Ta(:,2);1
% D(:, 3) = Ta(:,3);


W1 = 2*rand(5, 3) - 1;
W2 = 2*rand(5, 5) - 1;
W3 = 2*rand(5, 5) - 1;
W4 = 2*rand(3, 5) - 1;

[Xn,Xs] = mapminmax(X);
[Dn,Ds] = mapminmax(D);



for epoch = 1:100 % train
 [W1, W2, W3, W4] = DeepReLU(W1, W2, W3, W4, X, D);
end

N = 5001; % inference

for k = 1:N 
x = X(:, k); 
v1 = W1*x; 
y1 = Tanh(v1); 
v2 = W2*y1; 
y2 = Tanh(v2); 
v3 = W3*y2;
y3 = Tanh(v3); 
v = W4*y3;
%y = purelin(v);
y = Tanh(v);

Z = mapminmax('reverse',v,Ds);

O(1,k)=Z(1);
O(2,k)=Z(2);
O(3,k)=Z(3);

% y(k,1) = Sigmoid(v(1))
% y(k,2) = Sigmoid(v(2))
% y(k,3) = Sigmoid(v(3))

end
