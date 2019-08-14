clc;clear;
I = imread('D:\Miguel\Taipei Tech\PAPER\PROGRAM\Images\lena.jpg');                  %read plain image
I1 = imread('D:\Miguel\Taipei Tech\PAPER\PROGRAM\Images\encryp.png');               %read encrypted image
n=2100;                                                                     %how many pairs you want to plot
m=1100;
%%____________________________HORIZONTAL___________________________________
        %Similarity of two horizontal adjacent pixels in plain-image
%__________________________________________________________________________

x=1;y=1;b=1;                                                                %to create new variables 

Gray_I=rgb2gray(I);                                                         %to convert fulcolor image into grayscale image
[M,N]=size(Gray_I);                                                         %get values of the height and width of the grayscale image

while x<M                                                                   %repeat the loop while x is less than M
    N_aux(1,:)=Gray_I(x,:);                                                 %Copy all values of Matrix which position is varying x in auxiliar matrix N_aux
    a=size(N_aux);                                                          %get the size of the auxiliar matrix and save in a
    while y<a(2)                                                            %while the  value of y is less than a(2) which is one of the values getting in the previous step
        Matrix_C(b,1)=N_aux(1,y);                                           %Assign values kept in auxiliary matrix getting in a horizontal way in matrix_C column 1
        Matrix_C(b,2)=N_aux(1,y+1);                                         %Assign values kept in auxiliary matrix getting in a horizontal way in matrix_C column 2
        y=y+1;                                                              %increase y in 1
        b=b+1;                                                              %increase value of b in 1
    end                
    x=x+64;                                                                 %increase x in 64. this means that each 64 values we get the respective value
    y=1;                                                                    %due to we have already checked all values in one column we need to restart this value, it will start again in 1                                                                   
    
end

R = corr2(Matrix_C(:,1),Matrix_C(:,2));                                     %calculate the correlation between two sucesive pixels


%__________________________________________________________________________
       %Similarity of two horizontal adjacent pixels in cipher-image
%__________________________________________________________________________
x=1; y=1;b=1;                                                               %restart values x, y and b used previously
Gray_I1=I1;                                                                 %copy all data kept in I1 to Gray_I1
[M,N]=size(Gray_I1);                                                        %get values of the height and width of the grayscale image

while x<M                                                                   %repeat the loop while x is less than M
    N_aux(1,:)=Gray_I(x,:);                                                 %Copy all values of Matrix which position is varying x in auxiliar matrix N_aux
    a=size(N_aux);                                                          %get the size of the auxiliar matrix and save in a
    while y<a(2)                                                            %while the  value of y is less than a(2) which is one of the values getting in the previous step
        Matrix_C_E(b,1)=Gray_I1(1,y);                                       %Assign values kept in auxiliary matrix getting in a horizontal way in matrix_C_E column 1
        Matrix_C_E(b,2)=Gray_I1(1,y+1);                                     %Assign values kept in auxiliary matrix getting in a horizontal way in matrix_C_E column 2
        y=y+1;                                                              %increase y in 1
        b=b+1;                                                              %increase value of b in 1
    end 
    x=x+64;                                                                 %increase x in 64. this means that each 64 values we get the respective value
    y=1;                                                                    %due to we have already checked all values in one column we need to restart this value, it will start again in 1
    
end

R1 = corr2(Matrix_C_E(:,1),Matrix_C_E(:,2));                                %calculate the correlation between two sucesive pixels

%%_____________________________VERTICAL____________________________________
    %Similarity of two vertical adjacent pixels in plain-image
%__________________________________________________________________________
x=1; y=1;b=1;                                                               %restart values x, y and b used previously
B=Gray_I;                                                                   %copy all pixel values from graylevel image 
[MV,NV]=size(B);                                                            %get values of the height and width of the grayscale image
while y<NV                                                                  %repeat the loop while y is less than NV
    M_aux(:,1)=B(:,y);                                                      %Copy all values of Matrix which position is varying y in auxiliar matrix M_aux
    a=size(M_aux);                                                          %get the size of the auxiliar matrix and save in a
    while x<a(1)                                                            %while the  value of x is less than a(1) which is one of the values getting in the previous step
        B1(b,1)=M_aux(x);                                                   %Assign values kept in auxiliary matrix getting in a vertical way in B1 row 1
        B1(b,2)=M_aux(x+1);                                                 %Assign values kept in auxiliary matrix getting in a vertical way in B1 row 1
        x=x+1;                                                              %increase x in 1
        b=b+1;                                                              %increase value of b in 1
    end
    x=1;                                                                    %due to we have already checked all values in one row we need to restart this value, it will start again in 1
    y=y+64;                                                                 %increase y in 64. this means that each 64 values we get the respective value
end

R2 = corr2(B1(:,1),B1(:,2));                                                 %calculate the correlation between two sucesive pixels


%__________________________________________________________________________
       %Similarity of two vertical adjacent pixels in cipher-image
%__________________________________________________________________________
x=1; y=1;b=1;xx=1;
BE=I1;
[MV,NV]=size(BE);
while y<NV
    M_auxE(:,1)=BE(:,y);
    a=size(M_aux);
    while x<a(1)
        B1E(b,1)=M_auxE(x);
        B1E(b,2)=M_auxE(x+1);
        x=x+1;
        b=b+1;
    end
    x=1;
    y=y+64;
end

R3 = corr2(B1E(:,1),B1E(:,2));



%% _____________________________DIAGONAL___________________________________
        %Similarity of two diagonal adjacent pixels in plain-image
%__________________________________________________________________________
x=1; y=0;b=1;                                                               %restart values x, y and b used previously
C = Gray_I;                                                                 %copy all pixel values from graylevel image
[MD,ND]=size(C);                                                            %get values of the height and width of the grayscale image
while y<ND                                                                  %repeat the loop while y is less than ND
    x1 = diag(C,y);                                                         %read diagonal from matrix C 
    a=size(x1);                                                             %get the size of the auxiliar matrix and save in a
    while x<a(1)                                                            %while the  value of x is less than a(1) which is one of the values getting in the previous step
        M_D(b,1)=x1(x);
        M_D(b,2)=x1(x+1);
        x=x+1;                                                              %increase x in 1
        b=b+1;                                                              %increase value of b in 1
    end
     x=1;                                                                   %due to we have already checked all values in one row we need to restart this value, it will start again in 1
    y=y+64;                                                                 %increase y in 64. this means that each 64 values we get the respective value
end

R4 = corr2(M_D(:,1),M_D(:,2));                                               %calculate the correlation between two sucesive pixels

%__________________________________________________________________________
       %Similarity of two diagonal adjacent pixels in cipher-image
%__________________________________________________________________________
x=1;y=0;b=1;
CE = I1;
[MD,ND]=size(CE);
while y<ND
    x2 = diag(CE,y);
    a=size(x2);
    while x<a(1)
        M_DE(b,1)=x2(x);
        M_DE(b,2)=x2(x+1);
        x=x+1;
         b=b+1;
    end
    x=1;
    y=y+64;
end
R5 = corr2(M_DE(:,1),M_DE(:,2));
 

nn=n-m;
figure (1)
subplot(3,2,1);
plot(Matrix_C(1:n,1),Matrix_C(1:n,2),'.');ylabel('Values (x+1)'); xlabel('Values (x)');
title('Similarity of two horizontal adjacent pixels in plain-image');
subplot(3,2,2);
plot(Matrix_C_E(1:n,1),Matrix_C_E(1:n,2),'.');ylabel('Values (x+1)'); xlabel('Values (x)');
title('Similarity of two horizontal adjacent pixels in cipher-image');
subplot(3,2,3);
plot(B1(1:n,1),B1(1:n,2),'.');ylabel('Values (y+1)'); xlabel('Values (y)');
title('Similarity of two vertical adjacent pixels in plain-image');
subplot(3,2,4);
plot(B1E(1:nn,1),B1E(1:nn,2),'.');ylabel('Values (y+1)'); xlabel('Values (y)');
title('Similarity of two vertical adjacent pixels in cipher-image');
subplot(3,2,5);
plot(M_D(1:n,1),M_D(1:n,2),'.');ylabel('Values (x+1,y+1)'); xlabel('Values (x,y)');
title('Similarity of two diagonal adjacent pixels in plain-image');
subplot(3,2,6);
plot(M_DE(1:nn,1),M_DE(1:nn,2),'.');ylabel('Values (x+1,y+1)'); xlabel('Values (x,y)');
title('Similarity of two diagonal adjacent pixels in cipher-image');
fprintf('                          CORRELATION ANALYSIS                             \n')
fprintf('_________________________________________________________________________\n');
fprintf('       MODEL                 ORIGINAL IMAGE           CIPHERED IMAGE\n');
fprintf('_________________________________________________________________________\n');
fprintf('  HORIZONTAL                 %f                       %f                 \n',R,R1);
fprintf('  VERTICAL                   %f                       %f                 \n',R2,R3);
fprintf('  DIAGONAL                   %f                       %f                 \n',R4,R5);
fprintf('_________________________________________________________________________\n');


%% _____________________________ENTROPY______________________________________________

J = entropy(Gray_I);
J_E = entropy(I1);
fprintf('\n                          ENTROPY                             \n')
fprintf('_________________________________________________________________________\n');
fprintf('                ORIGINAL IMAGE           CIPHERED IMAGE\n');
fprintf('_________________________________________________________________________\n');
fprintf('                %f                       %f                 \n',J,J_E);
fprintf('_________________________________________________________________________\n');
