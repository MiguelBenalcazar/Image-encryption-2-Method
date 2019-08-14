function [ Aux_T_D,IC_N] = Orden_Decrypt_C(  Aux_M,m,n,IC_I )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
acum_test=0;
[ Aux_T_B] = Trans_dec2bin( Aux_M,m,n);                                     %Aux_T_B is a matrix that has been already changed in binary values and already arrange column by column
[ Matrix_Position_x,Matrix_Position_y, IC_col ,IC_row ,IC_N] = Position( m,n, IC_I );
for x=1:m 
    for y=1:n*8
      
        Aux_T_B_N(x,y)=Aux_T_B(x,Matrix_Position_y(x,y));
       
    end
end
for y=1:n*8
    for x=1:m
        
        Total(x,y)= Aux_T_B_N(Matrix_Position_x(x,y),y);
      
    end
 end 

[M_b,N_b]=size(Total);
N_b_a=N_b/8;
acum=0;

for y=1:N_b_a
    for x=1:M_b       
        Aux_M_C_B(x+M_b*(y-1),1:8)=Total(x,1+8*(y-1):8*y);
    end
end
Aux_D=bi2de(Aux_M_C_B,'left-msb');
y=1;
while y<=n
    for x=1:m
        Aux_T_D(x,y)=Aux_D(x+m*(y-1),1);
    end
y=y+1;
end


end