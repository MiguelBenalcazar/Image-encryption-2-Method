clc;clear;
User = input('User:  ', 's');                                      %To read password or user key
[ Symbol_U, data ] = Base32_Funct( User );

password = input('Password :  ', 's');                                      %To read password or user key
[ Symbol_K, data_ ] = Base32_Funct_key( password );

for i=1:8
    IC_Matrix(i)=data(i)/data_(i);
end
%%_______________initial encrypt stage____________________________________
initial_CL=[IC_Matrix(2)    IC_Matrix(3)   IC_Matrix(4)];                               %Lorenz's Chaotic System
initial_CL1=[IC_Matrix(5)  IC_Matrix(6)  IC_Matrix(7)];                                  %Chen's Chaotic System                  
IC_I_C=IC_Matrix(8);

%% _______________________________________________________________________

IC_I=IC_Matrix(1);                                                          %Logistic Map to get shuffling or rows and columns
tic;
I=imread('D:\Miguel\Taipei Tech\PAPER\PROGRAM\Images\encryp.png');
Gray_I=I;                                                                  %to grey value
Original=Gray_I;                                                            %Copy the gray value to a matrix called "Original"
[M,N]=size(Gray_I);                                                         %getting the size in columns=N and  rows=M

M_T=0;N_T=0;                                                                %Creating and Inicializating new variables 
M_a=floor(M/16);                                                            %Assign to M_a the result of divide numbers of rows and 16, this allows knowing how many groups there will be
M_b=mod(M,16);                                                              %Assign to M_b the remainder between  numbers of rows and 16, this allows knowing how many rows stay
if M_b>0                                                                    %if the remainder is greater than 0, then one group will be added, all this in a new Variable M_T that represents the total of groups in rows
    M_T=M_a+1;
else
    M_T=M_a;
end
M_n=0;N_n=0;                                                                %Variables created to get information about  how many rows and columns left to cover if there are remainder

N_a=floor(N/4);                                                             %Assign to N_a the result of divide numbers of columns and 4, this allows knowing how many groups there will be
N_b=mod(N,4);                                                               %Assign to N_b the remainder between  numbers of columns and 4, this allows knowing how many rows stay
if N_b>0                                                                    %if the remainder is greater than 0, then one group will be added, all this in a new variable N_T that represents the total of groups in columns
    N_T=N_a+1;
else
    N_T=N_a;
end

acum_aux_col=0; acum_aux_row=0;                                             %Creating new variables that allow knowing how many columns or rows the program has already covered
shift_col=0; shift_row=0;                                                   %Creating new variables that allow knowing how many columns and rows we have to shift

while acum_aux_row<M_T
    
    acum_aux_row=acum_aux_row+1;
    if acum_aux_row>M_a && M_b~=0
        M_n=16-M_b;
    end
    
    while acum_aux_col<N_T
        
        acum_aux_col=acum_aux_col+1;
        if acum_aux_col>N_a && N_b~=0
            N_n=4-N_b;
        end
        
        for j=1+shift_col:4*acum_aux_col-N_n
            for i=1+shift_row:(16*acum_aux_row)-M_n
                Aux_M(i,j)=Gray_I(i,j);
                Aux_M_(i-shift_row,j-shift_col)=Aux_M(i,j);
            end
        end
        
        
        %% ______________________________Decrypt_____________________________________
        m=16-M_n;n=4-N_n;
        [ initial_CL_N,initial_CL1_N,IC_I_N,CombState_M ] = Crypt( initial_CL,initial_CL1,IC_I_C,m,n);
        [ Aux_Crypt] = Decryption_Matrix(  CombState_M, Aux_M_ , m, n );        
        initial_CL=initial_CL_N;                                                    %Lorenz's Chaotic System
        initial_CL1=initial_CL1_N;                                                  %Chen's Chaotic System
        IC_I_C=IC_I_N;
        %%_________________________________________________________________________
        
        %% ______________________________SHUFFLING__________________________________
         m=16-M_n;n=4-N_n;
         
         [ Aux_T_D,IC_N] = Orden_Decrypt_C(Aux_Crypt,m,n,IC_I );
        for j=1+shift_col:4*acum_aux_col-N_n
             for i=1+shift_row:(16*acum_aux_row)-M_n
                 Aux_M_T(i,j)=Aux_T_D(i-shift_row,j-shift_col);
             end
         end

 clearvars  Aux_M_ Aux_T_D
 IC_I=IC_N;
%%_________________________________________________________________________




        shift_col=shift_col+4;
    end
    
    shift_col=0;acum_aux_col=0;
    shift_row=shift_row+16;
end
%% ________________________________________________________________________

count=1;x=N;y=1;
%turning odd rows
while count<=M
   if mod(count,2)~=0 
      aux_M_(1,:)= Aux_M_T(count,:);
      while x>=1
         Aux_M_T(count,y)=aux_M_(1,x);
         y=y+1;
         x=x-1;
      end
      i=i+1;
   end
   count=count+1;
   y=1;x=N;
end
count=1; i=1; x=M; y=1;

%turning Odd columns
while count<=N
   if mod(count,2)~=0 
      aux_M(:,1)= Aux_M_T(:,count);
      while x>=1
         Aux_M_T(y,count)=aux_M(x,1);
         y=y+1;
         x=x-1;
      end
      i=i+1;
   end
   count=count+1;
   y=1;x=M;
end




%% _____________________________________________________________________
        
imB2 = uint8(Original);
imB = uint8(Aux_M_T);


figure(1)
subplot(1,2,1); 
imshow(imB); title('Plain-Image');%plot plain image
subplot(1,2,2);
imhist(imB);title('Histogram of Plain-Image');%plot Histogram
 
figure (2); 
subplot(1,2,1); 
imshow(imB2); title('Cipher-Image');%plot plain image
subplot(1,2,2);
imhist(imB2);title('Histogram of Cipher-Image');%plot Histogram

toc;
