function [ Matrix_Position_x,Matrix_Position_y, IC_col ,IC_row ,IC_N] = Position( a,b, IC_I )
%this function allows permuting all columns and rows just using one
%logistic map, a new Initial condition is assigned after each interaction
%a is the height of the window
%b is the width of the window
%IC_I is the initial condition
%return:
%Matrix_position_x
%Matrix_position_y
x(1) = IC_I;                                                                %initial condition for logistic map
n=1;                                                                        %auxiliary variable                                               
flag=1;                                                                     %auxiliary variable
acum=0;                                                                     %auxiliary variable
aux=0;                                                                      %auxiliary variable
b=b*8;                                                                      %width * 8  (matrix was changed to bits)                                                                   
%% ________________________shuffling columns_______________________________
    for np=1:a                                                              %since np until a that represent number of rows
        while flag<=b                                                       %b represent number of columns
            x(n+1) = 4*x(n)*(1-x(n));                                       %x represent the logistic map
            l(n)=mod(floor(x(n)*10^14),b)+1;                                %modular math to get values between [1-b]
            %To check if a empty position has already been filled
            for i=1:n
                if l(i)==l(n)
                    acum=acum+1;
                end
            end
            if acum>1
                n=n+1;
            else
                Matrix_Position_y(np,flag)=l(n);                            %Matrix_Position_y return the position matrix in the column                         
                IC_col(np,flag)=x(n);                                       %IC_col represent the new initial conditon 
                %Matrix_Position(3,flag)=n;
                flag=flag+1;
                n=n+1;
            end
        
            acum=0;
        end
        % plot(x(1:M),x(2:M+1),'b*');xlabel('x_n'); ylabel('x_{n+1}')
        %plot3(x(1:M),x(2:M+1),x(3:M+2),'b*')
        x(1)=IC_col(np,b);                                                  %the last result gotten in the previous column will be used to the new one
        flag=1;
        n=1;
    end
%%%________________________________________________________________________    
%% shufling rows
n=1;                                                                        %auxiliary variable
flag=1;                                                                     %auxiliary variable
acum=0;                                                                     %auxiliary variable
aux=0;                                                                      %auxiliary variable
   for np=1:b                                                               %b represent number of rows
    while flag<=a
        x(n+1) = 4*x(n)*(1-x(n));                                           %x represent the result of logistic map
        l(n)=mod(floor(x(n)*10^14),a)+1;                                    %modular math to get values between [1-a]
        %To check if a empty position has already been filled
        for i=1:n
            if l(i)==l(n)
                acum=acum+1;
            end
        end
        if acum>1
            n=n+1;
        else
            Matrix_Position_x(flag,np)=l(n);                                %Matrix_Position_x return the position matrix in the rows  
            IC_row(flag,np)=x(n);                                           %IC_row represent the new initial conditon 
            %Matrix_Position(3,flag)=n;
            flag=flag+1;
            n=n+1;
        end
        
        acum=0;
    end
   % plot(x(1:M),x(2:M+1),'b*');xlabel('x_n'); ylabel('x_{n+1}')
   %  plot3(x(1:M),x(2:M+1),x(3:M+2),'b*')
    x(1)=IC_row(a,np);                                                      %the last result gotten in the previous column will be used to the new one
    IC_N=x(1);
    flag=1;
    n=1;
end



end

