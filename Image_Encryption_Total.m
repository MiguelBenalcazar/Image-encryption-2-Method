clc;clear;
User = input('User:  ', 's');                                               %To read user, 10 spaces as requirement
[ Symbol_U, data ] = Base32_Funct( User )                                  %Return Symbol_U which is a representation of the user in Base32 and data which is the numerical representation of base 32

password = input('Password :  ', 's');                                      %To read user, 16 spaces as requirement
[ Symbol_K, data_ ] = Base32_Funct_key( password );                         %Return Symbol_U which is a representation of the user in Base32 and data which is the numerical representation of base 32

for i=1:8
    IC_Matrix(i)=data(i)/data_(i);                                          %Return Initial Condition, IC_Matrix is vector created to keep all eight initial conditions needed in the system. 
end
%%_______________initial encrypt stage____________________________________
initial_CL=[IC_Matrix(2)    IC_Matrix(3)   IC_Matrix(4)]                   % Initial_CL is vector created to keep initial values of Lorenz's Chaotic System
initial_CL1=[IC_Matrix(5)  IC_Matrix(6)  IC_Matrix(7)]                     % Initial_CL1 is vector created to keep initial values of Chen's Chaotic System                  
IC_I_C=IC_Matrix(8)                                                        % IC_I_C represents the initial condition uses in logistic map which helps us to decide the states to use in the encryption stage
%% _______________________________________________________________________


IC_I=IC_Matrix(1)                                                          %IC_I represents the initial conditioin to use in the Logistic Map to get shuffling or rows and columns

tic;
I=imread('C:\Users\ENCRYPTION-PC\Desktop\tesis\Image\lena.jpg');          %import color image I represents a RGB matrix
Gray_I=rgb2gray(I);                                                         %Gray_I represent the grey image value of the plain image
Original=Gray_I;                                                            %Copy the gray value to a matrix called "Original" 
[M,N]=size(Gray_I);                                                         %getting the size in columns=N and  rows=M, heigh=M and width=N

M_T=0;N_T=0;                                                                %Creating and Inicializing new variables M_T will represent the times we have to pass a moving window with respect to rows, and NT with respect to the columns
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


%% ________________________________________________________________________

%Variable count has been created to know if all rows or columns have been
%analyzed in this stage
count=1; i=1; x=M; y=1;                                                    


%turning Odd rows
while count<=N
   if mod(count,2)~=0                                                       %If count is odd then
      aux_M(:,1)= Gray_I(:,count);                                          %the selected row is copied into an  aux variable, variable aux_M is just an auxiliary vector that will keep a row before to change each pixel position
      while x>=1                                                            %if x thta represent the row position is greater than or equal to one
         Gray_I(y,count)=aux_M(x,1);                                        %the row is rotated
         y=y+1;                                                             %y represnt the row position  gray_I will increase
         x=x-1;                                                             %x represents the row position, decreased since the last one
      end
      i=i+1;
   end
   count=count+1;
   y=1;x=M;
end
count=1;x=N;y=1;
%turning odd columns
while count<=M                                                              %If count is odd then
   if mod(count,2)~=0                                                       %the selected row is copied in a  aux variable
      aux_M_(1,:)= Gray_I(count,:);                                         %the selected column is copied into an  aux variable, variable aux_M is just an auxiliary vector that will keep a row before to change each pixel position
      while x>=1                                                            %if x thta represent the column position is greater than or equal to one
         Gray_I(count,y)=aux_M_(1,x);                                       %the column is rotated                                       
         y=y+1;                                                             %y represnt the column position  gray_I will increase
         x=x-1;                                                             %x represents the column position, decreased since the last one
      end
      i=i+1;
   end
   count=count+1;
   y=1;x=N;
end

%% ________________________MOVING WINDOW STAGE_____________________________
acum_aux_col=0; acum_aux_row=0;                                             %To create two variables acum_aux_col and acum_aux_row. these variables will help us to accumulate and know how many times the moving window has run 
shift_col=0; shift_row=0;                                                   %To create two variables shift_col and shift_row. these variables will help us to know how many rows and columns we need to displace the moving window

while acum_aux_row<M_T
    acum_aux_row=acum_aux_row+1;
    if acum_aux_row>M_a && M_b~=0
        M_n=16-M_b;                                                         %M_n is a variable created to adjust the size of the window, the height of the moving window
    end
    
    while acum_aux_col<N_T
        
        acum_aux_col=acum_aux_col+1;
        if acum_aux_col>N_a && N_b~=0
            N_n=4-N_b;                                                      %N_n is a variable created to adjust the size of the window, the width of the moving window
        end
        
        for j=1+shift_col:4*acum_aux_col-N_n
            for i=1+shift_row:(16*acum_aux_row)-M_n
                Aux_M(i,j)=Gray_I(i,j);                                     %Aux_M auxiliary matrix to move the pixels of selected window 
                Aux_M_(i-shift_row,j-shift_col)=Aux_M(i,j);                 %Aux_M_ matrix created to keep the pixels of select window in the whole process
            end
        end
        
%% _________________________SHUFFLING STAGE__________________________________
         m=16-M_n;n=4-N_n;                                                  % variables m represent the height of the adaptive window and n represents the width of the adaptive window
         [ Aux_T_D,IC_N] = Orden_C(Aux_M_,m,n,IC_I );                       % call function Orden_C, this function allows rearranging the pixel values in bit level of the window  
         clearvars  Aux_M_
         
         
         
         for j=1+shift_col:4*acum_aux_col-N_n
            for i=1+shift_row:(16*acum_aux_row)-M_n
                new(i,j)=Aux_T_D(i-shift_row,j-shift_col);      %Aux_M_T_Crypt is the final matrix, encrypted matrix
            end
        end
         
         
         
         % delete variable Aux_M_ 
         %Aux_T_D
        IC_I=IC_N;                                                          %IC_I is the new initial condition for logistic map in the next windows
%%_________________________________________________________________________

%% ___________________ENCRYPTION STAGE_____________________________________
[ initial_CL_N,initial_CL1_N,IC_I_N,CombState_M ] = Crypt( initial_CL,initial_CL1,IC_I_C,m,n); %Crypt function return two new initial conditions (initial_CL_N and initial_CL1_N) of both system used and the logistic mao used in this stage (IC_I_N)and the combination state selected

[ Aux_Crypt] = Encryption_Matrix(  CombState_M, Aux_T_D , m, n );           %function to apply the encryption process using data provided in variable CombState_M
        for j=1+shift_col:4*acum_aux_col-N_n
            for i=1+shift_row:(16*acum_aux_row)-M_n
                Aux_M_T_Crypt(i,j)=Aux_Crypt(i-shift_row,j-shift_col);      %Aux_M_T_Crypt is the final matrix, encrypted matrix
            end
        end
initial_CL=initial_CL_N;                                                    %Lorenz's Chaotic System Updating initial condition
initial_CL1=initial_CL1_N;                                                  %Chen's Chaotic System Updating initial condition               
IC_I_C=IC_I_N;     
%%_________________________________________________________________________
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
        shift_col=shift_col+4;
    end
    
    shift_col=0;acum_aux_col=0;
    shift_row=shift_row+16;
end


imB3 = uint8(Aux_M_T_Crypt);
imB2 = uint8(Original);

 
figure (1); 
subplot(1,2,1); 
imshow(imB2); title('Plain-Image');%plot plain image
subplot(1,2,2);
imhist(imB2);title('Histogram of Plain-Image');%plot Histogram

figure (2); 
subplot(1,2,1); 
imshow(new); title('Plain-Image');%plot plain image
%imshow(Aux_T_D); title('Plain-Image');%plot plain image



subplot(1,2,2);
imhist(new);title('Histogram of Plain-Image');%plot Histogram


figure (3); 
subplot(1,2,1); 
imshow(imB3); title('Cipher-Image');%plot plain image
subplot(1,2,2);
imhist(imB3);title('Histogram of Cipher-Image');%plot Histogram
toc;
imwrite(imB3,'C:\Users\ENCRYPTION-PC\Desktop\tesis\Image\encryp.png')
