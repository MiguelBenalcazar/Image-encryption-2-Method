function [ Aux_T_D,IC_N] = Orden(  Aux_M,m,n,IC_I )
%This function was design to get the shuffling matrix of an adaptive
%window until 16x4, as input 
%Aux_M window of pixels selected
%m the height of the window
%n the width of the window
%IC_I initial condition of logistic map
%as output:
%Aux_T_D shuffling matrix
%IC_N is the new initial condition
[ Aux_T_B] = Trans_dec2bin( Aux_M,m,n);                                     %Aux_T_B is a matrix that has been already changed in binary values and already arrange column by column, A new function is called, Aux_T_B is the window bit matrix
[ Matrix_Position_x,Matrix_Position_y, IC_col ,IC_row ,IC_N] = Position( m,n, IC_I ); %call function in which get as a result of the matrix positionsto use in the columns and also in the rows
for y=1:n*8
    for x=1:m
        Aux_T_B_N(Matrix_Position_x(x,y),y)=Aux_T_B(x,y);                   %Permuting rows to their new position, Aux_T_B_N is an auxiliary matrix 
    end
end
        
for x=1:m
    for y=1:n*8
        Aux_Total(x,Matrix_Position_y(x,y))=Aux_T_B_N(x,y);                 %Permuting columns to their new position,  Aux_Total is the total shuffling matrix
    end
 end

[M_b,N_b]=size(Aux_Total);                                                  %M_b is the height of the shuffling matrix and N_b is the width of the shuffling matriz
N_b_a=N_b/8;                                                                %N_b_a  is the number of pixels                     
acum=0;


for y=1:N_b_a
    for x=1:M_b       
        Aux_M_C_B(x+M_b*(y-1),1:8)=Aux_Total(x,1+8*(y-1):8*y);              %Aux_M_C_B this matrix is the result of moving each 8 bits to represent a pixel to a different row
    end
end
Aux_D=bi2de(Aux_M_C_B,'left-msb');                                          %Aux_D is the bit matrix into pixel matrix
y=1;
while y<=n
    for x=1:m
        Aux_T_D(x,y)=Aux_D(x+m*(y-1),1);                                    %Aux_T_D is the reordered matrix into its original window size
    end
y=y+1;
end


end

