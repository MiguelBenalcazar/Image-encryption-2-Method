function [ Symbol, data_] = Base32_Funct_key( password )


ASCII_=double(password);                                                    %change from ASCII to theirs numerical equivalent 
Bit=de2bi(ASCII_,'left-msb',8);                                             %change decimal to binary

size_Bit=size(Bit);                                                         %to get the size of  matrix called Bits
n=size_Bit(1)*size_Bit(2);
Bit_Chain=zeros(1,n);                                                       %to create a new vector called Bit_chain where data from matrix "Bit" will be copied.
%%*************************************************************************%
                   %% to convert a matrix into a vector
%%**************************************************************************%                   
x=size_Bit(1);                                                              %number of rows
y=size_Bit(2);                                                              %number of columns
x_=1;                                                                       %flag in rows
y_=1;                                                                       %flag in columns                                 
for i=1:n                                                                   %until columns in vector
    if x_<=x                                                                %if flag in rows is less than number of rows in the matrix 
         if y_<=y                                                           %if flag in columns is less than number of columns in the matrix 
            Bit_Chain(1,i)= Bit(x_,y_);                                     %copy in a new vector Bit_Chain the values in matrix Bit
            y_=y_+1;                                                        %add 1 to the columns, this until 8 or max value of columns in the matrix
        end
        if y_>y                                                             %flag in columns is greater than columns in the matrix
            x_=x_+1;                                                        %add 1 to the rows, this until y or max value of rows in the matrix                                                       
            y_=1;                                                           %restar flag in columns
        end
    end    
end
%% ------------------------------------------------------------------------%
         %%to check if columns in the vector are divisible to 5
%%-------------------------------------------------------------------------%         
Bit_Chain1=Bit_Chain;
while mod(n,5)~=0
    Bit_Chain1(1,n+1)=0;
    n_aux=size(Bit_Chain1);
    n=n_aux(2);
end
%% *************************************************************************%
%%to convert vector Bit_Chain1 into a matrix; with 5 columns in the matrix
%%-------------------------------------------------------------------------%
n_aux=size(Bit_Chain1);
x=n_aux(2);                                                                 %number of rows
y=5;
x_=1;
y_=1;
for i=1:n
   if x_<=x                                                                 %if flag in rows is less than number of rows in the matrix 
         if y_<=y                                                           %if flag in columns is less than number of columns in the matrix 
            Bit_Chain_M(x_,y_)= Bit_Chain1(1,i);                            %copy in a new vector Bit_Chain the values in matrix Bit
            y_=y_+1;                                                        %add 1 to the columns, this until 8 or max value of columns in the matrix
        end
        if y_>y                                                             %flag in columns is greater than columns in the matrix
            x_=x_+1;                                                        %add 1 to the rows, this until y or max value of rows in the matrix                                                       
            y_=1;                                                           %restar flag in columns
        end
    end  
    
end
%% -------------------------------------------------------------------------%
                        %%from binary to decimal
%%-------------------------------------------------------------------------%
Index=bi2de(Bit_Chain_M,'left-msb');
Index=Index';

%% -------------------------------------------------------------------------%
                      %%To change RFC4648 Base32
%%-------------------------------------------------------------------------%                      
Size_Index=size(Index);
Size_Col_Index=Size_Index(2);
Size_Row_Index=Size_Index(1);

for i=1:Size_Col_Index
    Symbol(1,i)=Base32_RFC(Index(1,i));                                     %call function 
end
%disp(Symbol);

%% -------------------------------------------------------------------------%
                       %%making just one number
%%-------------------------------------------------------------------------%                       
m=1;p=1;
while m<Size_Col_Index && p<=9
    if p<=8
        data(1,p)=Index(1,m)*10000+Index(1,m+1)*100+Index(1,m+2);
        m=m+3;
        p=p+1;
    end
    if p>8
        data(1,p)=Index(1,25)*100+Index(1,26);
        p=p+1;
    end
end
m=1;
while m<9 
        data_(1,m)=data(1,m)*data(1,9);
        m=m+1;    
    
end
