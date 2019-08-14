function [ Aux_Crypt] = Decryption_Matrix( CombState_M, Aux_M_T , m, n )
%this function was created to get the way back of encryption part
for j=1:n
            for i=1:m
                aux=Aux_M_T(i,j);                                           %Read pixel in  aux
                aux=de2bi(aux,8,'left-msb');                                %change pixel read form decimal to binary
               % fprintf('i--> %d  j__>%d\n',i,j );
                aux1=CombState_M(i,j);                                      
                aux1=de2bi(aux1,8,'left-msb');
                aux2=CombState_M(i,5);
                aux2=de2bi(aux2,8,'left-msb');
                aux_xor=xor(aux,aux2);
                aux_xor_T=xor(aux_xor,aux1);
                
                Aux_Crypt(i,j)=bi2de(aux_xor_T,'left-msb');
            end
        end

end

