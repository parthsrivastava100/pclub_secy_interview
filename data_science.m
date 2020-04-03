%% PROBLEM NO 5

%% PART 0---INITIALIZATION
clear;close all;clc;

%% PART 1---LOADING THE DATA

[num,txt,raw] = xlsread('train.csv');
train=raw;
[num,txt,raw] = xlsread('test.csv');
test=raw;
 
a= train{4,:}

%% PART 2--PROCESSING THE DATA 
 
 % We will categories the users into categories based on their courses and
 % also their course type
 
 %The features short promotion,public holiday,long promotion,user traffic
 %and competiiton metric is used to train the parameters.
 
 % First we implement feature scaling to the user_traffic column
 
 
 %In this part,we categorise the data into six fields(3 on the course and
 % 2 on types)
 
 % Counters of each type
 a=1;
 b=1;
 c=1;
 d=1;
 e=1;
 f=1;
 
 % Categorizing the data
 
 for i=1:size(train,1)
     if(train{i,4}== "Development")
         if(train{i,5}=="Course")
             dev_c(a,:)=train(i,:);    % Development Course
             a=a+1;
         elseif(train{i,5}=="Program")
             dev_p(b,:)=train(i,:);    % Development Program
             b=b+1;
         end
     elseif(train{i,4}== "Software Marketing")
         if(train{i,5}=="Course")
             sm_c(c,:)=train(i,:);     % Software Course
             c=c+1;
         elseif(train{i,5}=="Program")
             sm_p(d,:)=train(i,:);     % Software Program
             d=d+1;
         end
     elseif(train{i,4}== "Finance & Accounting")
         if(train{i,5}=="Course")     
             fa_c(e,:)=train(i,:);       % Finance Course
             e=e+1;
         elseif(train{i,5}=="Program")
             fa_p(f,:)=train(i,:);            % Finance Program
             f=f+1;
         end
     end
 end
 
dev_p(3,3);
 
 %% PART 3 --TRAINING PARAMETERS FOR  INDIVIDUAL CATEGORY
 
 % part 1--Development course   
 theta1=zeros(5,1);  % Initializing the Parameters
 alpha1=0.2;                      % Learning Rate
 iterations=1000;                 % Number of iterations
 % Extracting the features to double
 for i=1:size(dev_c,1)
     for j=1:5
         x(i,j)=dev_c{i,j+5};
     end
 end
 for i=1:size(dev_c,1)
     val(i,1)=dev_c{i,11};        % Storing the output in the form of doubles
 end
 for i=1:iterations
     for j=1:size(dev_c,1)
         for k=6:10
             cos(j,k-5)=dev_c{j,k}*theta1(k-5,1);
         end
     end
     cos=sum(cos,2);
     for j=1:size(theta1,1)                  % applying gradient descent
         theta1(j,1)=theta1(j,1)-(alpha1/size(dev_c,1))* sum((cos-val).* x(:,j));
     end
 end
 
 % part 2--Development program
 
 theta2=zeros(5,1);  % Initializing the Parameters
 alpha2=0.2;                      % Learning Rate
 iterations=1000;                 % Number of iterations
 % Extracting the features to double
 for i=1:size(dev_p,1)
     for j=1:5
         x(i,j)=dev_p{i,j+5};
     end
 end
 for i=1:size(dev_p,1)
     val(i,1)=dev_p{i,11};        % Storing the output in the form of doubles
 end
 for i=1:iterations
     for j=1:size(dev_p,1)
         for k=6:10
             cos(j,k-5)=dev_p{j,k}*theta2(k-5,1);
         end
     end
     cos=sum(cos,2);
     for j=1:size(theta2,1)                  % applying gradient descent
         theta2(j,1)=theta2(j,1)-(alpha2/size(dev_p,1))* sum((cos-val).* x(:,j));
     end
 end
     
 % part 3-- Software Course
 
 
  theta3=zeros(5,1);  % Initializing the Parameters
 alpha3=0.2;                      % Learning Rate
 iterations=1000;                 % Number of iterations
 % Extracting the features to double
 for i=1:size(sm_c,1)
     for j=1:5
         x(i,j)=sm_c{i,j+5};
     end
 end
 for i=1:size(sm_c,1)
     val(i,1)=sm_c{i,11};        % Storing the output in the form of doubles
 end
 for i=1:iterations
     for j=1:size(sm_c,1)
         for k=6:10
             cos(j,k-5)=sm_c{j,k}*theta3(k-5,1);
         end
     end
     cos=sum(cos,2);
     for j=1:size(theta3,1)                  % applying gradient descent
         theta3(j,1)=theta3(j,1)-(alpha3/size(sm_c,1))* sum((cos-val).* x(:,j));
     end
 end
 
 
 % Part 4 --Software program
 
  theta4=zeros(5,1);  % Initializing the Parameters
 alpha4=0.2;                      % Learning Rate
 iterations=1000;                 % Number of iterations
 % Extracting the features to double
 for i=1:size(sm_p,1)
     for j=1:5
         x(i,j)=sm_p{i,j+5};
     end
 end
 for i=1:size(sm_p,1)
     val(i,1)=sm_p{i,11};        % Storing the output in the form of doubles
 end
 for i=1:iterations
     for j=1:size(sm_p,1)
         for k=6:10
             cos(j,k-5)=sm_p{j,k}*theta4(k-5,1);
         end
     end
     cos=sum(cos,2);
     for j=1:size(theta4,1)                  % applying gradient descent
         theta4(j,1)=theta4(j,1)-(alpha4/size(sm_p,1))* sum((cos-val).* x(:,j));
     end
 end
 
 % Part 5 -- Finance Course
 
  theta5=zeros(5,1);  % Initializing the Parameters
 alpha5=0.2;                      % Learning Rate
 iterations=1000;                 % Number of iterations
 % Extracting the features to double
 for i=1:size(fa_c,1)
     for j=1:5
         x(i,j)=fa_c{i,j+5};
     end
 end
 for i=1:size(fa_c,1)
     val(i,1)=fa_c{i,11};        % Storing the output in the form of doubles
 end
 for i=1:iterations
     for j=1:size(fa_c,1)
         for k=6:10
             cos(j,k-5)=fa_c{j,k}*theta5(k-5,1);
         end
     end
     cos=sum(cos,2);
     for j=1:size(theta5,1)                  % applying gradient descent
         theta5(j,1)=theta5(j,1)-(alpha5/size(fa_c,1))* sum((cos-val).* x(:,j));
     end
 end
 
 % Part 6 -- Finance Program
 
 
  theta6=zeros(5,1);  % Initializing the Parameters
 alpha6=0.2;                      % Learning Rate
 iterations=1000;                 % Number of iterations
 % Extracting the features to double
 for i=1:size(fa_p,1)
     for j=1:5
         x(i,j)=fa_p{i,j+5};
     end
 end
 for i=1:size(fa_p,1)
     val(i,1)=fa_p{i,11};        % Storing the output in the form of doubles
 end
 for i=1:iterations
     for j=1:size(fa_p,1)
         for k=6:10
             cos(j,k-5)=fa_p{j,k}*theta6(k-5,1);
         end
     end
     cos=sum(cos,2);
     for j=1:size(theta6,1)                  % applying gradient descent
         theta6(j,1)=theta6(j,1)-(alpha6/size(fa_p,1))* sum((cos-val).* x(:,j));
     end
 end
 
 
 
 %% PART 5---TESTING ON THE test DATA
 
 % HERE I HAVE TAKEN INTO CONSIDERATION 5 FEATURES FROM THE TRAINING SET
 % BUT THE TESTING SET DOES NOT CONTAIN THE USAGE TRAFFIC.SO THIS PART HAS
 % TO BE MODIFIED A BIT TO GIVE THE VALUES

 for i=1:size(test,1)
     if(test(i,4)=="Development")
         if(test(i,5)=="Course")
             y(i)=[1 test(i,6:9)] * theta1;
         elseif(test(i,5)=="Program")
             y(i)=[1 test(i,6:9)] * theta2;
         end
     elseif(test(i,4)=="Software Marketing")
         if(test(i,5)=="Course")
             y(i)=[1 test(i,6:9)] * theta3;
         elseif(test(i,5)=="Program")
             y(i)=[1 test(i,6:9)] * theta4;
         end
     elseif(test(i,4)=="Finance and Accounting")
         if(test(i,5)=="Course")
             y(i)=[1 test(i,6:9)] * theta5;
         elseif(test(i,5)=="Program")
             y(i)=[1 test(i,6:9)] * theta6;
         end
     end
 end
 
 
 
 
 
 
 
 
     
 
 
 
 