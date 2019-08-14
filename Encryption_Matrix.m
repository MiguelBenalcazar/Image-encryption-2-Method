function [ Aux_Crypt] = Encryption_Matrix( CombState_M, Aux_M_T , m, n )
%this function is implemented to get all encrypted process
%XOR(XOR(data,chaotics system), logistic map)
%CombState_M is the combination of states selected from two chaotics
%systems
for j=1:n
            for i=1:m
                aux=Aux_M_T(i,j);                                           %Read pixel in  aux
                aux=de2bi(aux,8,'left-msb');                                %change pixel read form decimal to binary
               % fprintf('i--> %d  j__>%d\n',i,j );
                aux1=CombState_M(i,j);                                      %aux1=combination of states of two system                                                      
                aux1=de2bi(aux1,8,'left-msb');                              %change aux1 form decimal to binary
                aux2=CombState_M(i,5);                                      %aux2=combination of states of two system 
                aux2=de2bi(aux2,8,'left-msb');                              %change aux1 form decimal to binary
                aux_xor=xor(aux,aux1);                                      %XOR(data,chaotics system)
               aux_xor_T=xor(aux_xor,aux2);                                 %XOR(XOR(data,chaotics system), logistic map)
                
                Aux_Crypt(i,j)=bi2de(aux_xor_T,'left-msb');                 %Aux_Cryp is the encrypted window
            end
        end

end

