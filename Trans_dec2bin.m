function [ Aux_T_B] = Trans_dec2bin( Aux_M,m,col_)
%let us to transform values from decimal to binary to shuffling 
%As input Aux_M windows matrix
%As input m number of rows
%As input col_ number of columns
shift_bin=8;

Aux_B=de2bi(Aux_M,8,'left-msb');                                            %change matrix Aux_M to bin, after this, we will get a rows vector 
for y=1:8                                                                                                                                     
    for x=1:m
        
        Aux_T_B(x,y)=Aux_B(x,y);                                            
        if col_>1                                                           %if Aux_B has more than one column then
            Aux_T_B(x,y+shift_bin)=Aux_B(x+m,y);                            %move all bits moving  8 spaces
        end
        if col_>2                                                           %if Aux_B has more than 2 column then
            Aux_T_B(x,y+shift_bin*2)=Aux_B(x+m*2,y);                        %move all bits moving  16 spaces
        end
        if col_>3                                                           %if Aux_B has more than 3 column then
            Aux_T_B(x,y+shift_bin*3)=Aux_B(x+m*3,y);                        %move all bits moving  24 spaces
        end
    end
end

end

%then we get a matrix m x n*8