function [ initial_CL_N,initial_CL1_N,IC_I_N,CombState_M ] = Crypt( initial_CL,initial_CL1,IC_I_C,m,n)
%This function help us to get combination of states before to encrypt into
%a Hyperchaotic system  initial_CL Lorenz's Chaotic System ,initial_CL1 Chen's Chaotic System,
%IC_I logistic map,m,n size image 
%initial_CL_N new initial condition of Lorenz's Chaotic System,initial_CL1_N Chen's Chaotic System
%,IC_I_N logistic map,CombState_M  matrix that represent all states before
%to encrypt

x(1) = IC_I_C;
%Lorenz's Chaotic System
p=10;r=28;tt=8/3;                                                           %to define parameters from Loren's Chaotic system
f = @(t,x)[p*(x(2)-x(1));-x(1)*x(3)+r*x(1)-x(2);x(1)*x(2)-tt*x(3)];
                                   %initial conditions
%Chen's Chaotic System
a=35;b=3;c=28;                                                              %to define parameters from Chen's Chaotic system
g = @(t,y)[a*(y(2)-y(1));(c-a)*y(1)-y(1)*y(3)+c*y(2);y(1)*y(2)-b*y(3)];

ts=10;                                                                     %simulation time       
span=[0,ts];                                                                %time span. We have to change here to get more data. I should be depending on the image size
[t,xa] = ode45(@(t,x) f(t,x),span,initial_CL);                              %To solve the hyperchaotic system , xa represents the results of the system
[t,xb] = ode45(@(t,x) g(t,x),span,initial_CL1);                             %To solve the hyperchaotic system, xb represents the results of the system

figure (1);
subplot(1,2,1);plot3(xa(:,1),xa(:,2),xa(:,3)); grid on;
subplot(1,2,2);plot3(xb(:,1),xb(:,2),xb(:,3),'r'); grid on;

inf_matrix_rows_xa=size(xa);                                                %get the information of width and height of the first chaotic system
inf_matrix_rows_xb=size(xb);                                                %get the information of width and height of the second chaotic system               
if inf_matrix_rows_xa>inf_matrix_rows_xb                                    %assigning to the maximum value of the height to the new matrix
   inf_matrix_rows_total=inf_matrix_rows_xb;                                 
else
   inf_matrix_rows_total=inf_matrix_rows_xa;
end

%to create a matrix xi with values of state space of Lorenz's Chaotic System and Chen's Chaotic System
 for i=1:inf_matrix_rows_total
     for j=1:6
         if j>0 && j<4
            data(i,j)=xa(i,j);
         end
         if j>3 && j<7
             data(i,j)=xb(i,j-3);
         end
     end
 end
%% _________________________________________________________________________
            %----- to change all values between 0 and 256 -----%
%%__________________________________________________________________________
            for j=1:6
                for i=1:m
                    aux=abs(data(i,j));
                    data_(i,j)=mod(floor((aux-floor(aux))*10^14),256);     %to change all decimal fraction into gray values 
                end
            end
            initial_CL_N(1,:)=xa(i,:);                                      %copy values of new initial conditions which will be used in the next iteration of the first chaotic system
            initial_CL1_N(1,:)=xb(i,:);                                     %copy values of new initial conditions which will be used in the next iteration of the second chaotic system
            %IC_H(1,:)=data(i,:)
%%_________________________________________________________________________

%% _________________________________________________________________________
            %-----  Combination   -----%
%%__________________________________________________________________________

    for i=1:m
        x(i+1) = 4*x(i)*(1-x(i));                                           %to create a new chaotic logistic map, x represents the logistic map
        l(i)=mod(floor(x(i)*10^14),15);                                     %to convert all decimal fraction  into 0-15, which means pick up the combination of states, l represent the number of state
        l1(i)=mod(floor(x(i)*10^14),256);                                   %to change all decimal fraction into gray values
        [ CombState ] = Select_Number( l(i),data_,i);                       %the combination state selected return in CombState variable
        CombState_M(i,:)=CombState(1,:);                                    %The variable is kept in  a new matrix as a reference
    end
    IC_I_N=x(i);                                                            %new initial condition is stored to use in the next iteration of logistic map
    l1_aux=l1';                                                             %get the transpose of logistic map
    CombState_M(:,5)=l1_aux(:,1) ;                                          %CombState_M has all information to encrypt xor(combination,logisticmap)
%%_________________________________________________________________________

end

