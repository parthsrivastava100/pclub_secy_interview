%% QUESTION NUMBER 4

%% POLYNOMIAL REGRESSION
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

%% PART 2--MAKING NEW FEATURES(POLYNOMIALS)

x3= x1 .* x2;
x4= x1 .^2;
x5= x2 .^3;

%% PART 3-- IMPLEMENTING MEAN NORMALIZATION

%Here we have assumed that the features x1 and x2 are in the range 
% of 1-20 and therefore the remaining features will have larger values
% and therefore this can result in our cost function being trapped in
% a local minima.Therefore we implement mean normalization

a=[x3 x4 x5];
m=mean(a);
s=std(a);
x3=x3-ones(size(x3))*m(1,1);
x3=x3./std(1,1);
x4=x4-ones(size(x4))*m(1,2);
x4=x4./std(1,2);
x5=x5-ones(size(x5))*m(1,3);
x5=x5./std(1,3);


%% PART 4 --IMPLEMENTING GRADIENT DESCENT TO CALCULATE THE OPTIMUM VALUES OF THE PARAMETERS

%Adding intercept term
x0=ones(m,1);
X=[x0 x1 x2 x3 x4 x5];
% Initial parameters(including the intercept term theta-zero)
theta=zeros(size(X,2),1);    

alpha=0.1;  % the learning rate alpha 
iter=1500;   % The number of iterations
for i=1:iter
    cos=(X*theta);
    for j=1:size(theta,1)
        theta(j,1)=theta(j,1)-(alpha/m)*sum(cos .* X(:,j));
    end 
    
end


%This part could also be solved using some advanced optimization algorithm
%or using the normal equation

%% NOW THIS VALUE OF THE PARAMETERS CAN BE USED TO FURTHUR GIVE THE 

%% PREDICTIONS OF THE VALUES OF THE TEST SET BY SIMPLE MULTIPLICATION(x*theta)
    
    















