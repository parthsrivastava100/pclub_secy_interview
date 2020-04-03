%% QUESTION NMUBER 4

%% LASSO REGRESSION

%% PART 0 --INITIALIZATION
clear;close all;clc;



%% PART 1--LOADING DATA FROM THE EXTERNAL DATA SET
data =load('data_file_name.txt');

% We suppose that the file contains 3 columns
% The first column is for the first feature
% The second column is for the second feature
% The third column is the value output
m=size(data,1);   % Number of Training Examples

x1=data(:,1);
%Loading the first feature in X1
x2=data(:,2);
%Loading the  second feature in X2
y=data(:,3);
%Loading the data values in y


%% PART 2--IMPLEMENTING GRADIENT DESCENT TO CALCULATE THE OPTIMUM VALUES OF THE PARAMETERS
X=[ones(x1) x1 x2];
theta=zeros(size(X,2),1);
lambda=2.3;   % Regularization parameter lambda
iters=1500;   % Number of Iterations
alpha = 0.01;
for i=1:iters
    
    cos=X*theta;
    theta(1,1)=theta(1,1)-alpha*(2*sum(cos .* X(:,j)));
     for j=2:size(theta,1)
        theta(j,1)=theta(j,1)-alpha*(2*sum(cos .* X(:,j)) + lambda*abs(theta(j,1)));
    end  
    
end


%% NOW THE VALUES CAN BE EASILY CALCULATED BY USING THE TRAINED VALUES 

%% OF THE PARAMETERS











