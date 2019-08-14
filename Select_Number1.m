function [ CombState  ] = Select_Number1( input,data_,select)
acu_key=1;
switch input                                                               %To select key
    case 0
        CombState(acu_key,1)=data_(select,1);
        CombState(acu_key,2)=data_(select,1);
        CombState(acu_key,3)=data_(select,1);
        CombState(acu_key,4)=data_(select,1);
    case 1
        CombState(acu_key,1)=data_(select,1);
        CombState(acu_key,2)=data_(select,2);
        CombState(acu_key,3)=data_(select,1);
        CombState(acu_key,4)=data_(select,1);
    case 2
        CombState(acu_key,1)=data_(select,1);
        CombState(acu_key,2)=data_(select,3);
        CombState(acu_key,3)=data_(select,2);
        CombState(acu_key,4)=data_(select,1);
    case 3
        CombState(acu_key,1)=data_(select,1);
        CombState(acu_key,2)=data_(select,4);
        CombState(acu_key,3)=data_(select,3);
        CombState(acu_key,4)=data_(select,2);
    case 4
        CombState(acu_key,1)=data_(select,1);
        CombState(acu_key,2)=data_(select,5);
        CombState(acu_key,3)=data_(select,4);
        CombState(acu_key,4)=data_(select,3);
    case 5
        CombState(acu_key,1)=data_(select,1);
        CombState(acu_key,2)=data_(select,6);
        CombState(acu_key,3)=data_(select,5);
        CombState(acu_key,4)=data_(select,4);
    case 6
        CombState(acu_key,1)=data_(select,1);
        CombState(acu_key,2)=data_(select,6);
        CombState(acu_key,3)=data_(select,6);
        CombState(acu_key,4)=data_(select,5);
    case 7
        CombState(acu_key,1)=data_(select,1);
        CombState(acu_key,2)=data_(select,6);
        CombState(acu_key,3)=data_(select,6);
        CombState(acu_key,4)=data_(select,6);
        
    case 8
        CombState(acu_key,1)=data_(select,2);
        CombState(acu_key,2)=data_(select,1);
        CombState(acu_key,3)=data_(select,1);
        CombState(acu_key,4)=data_(select,1);
    case 9
        CombState(acu_key,1)=data_(select,2);
        CombState(acu_key,2)=data_(select,2);
        CombState(acu_key,3)=data_(select,1);
        CombState(acu_key,4)=data_(select,1);
    case 10
        CombState(acu_key,1)=data_(select,2);
        CombState(acu_key,2)=data_(select,3);
        CombState(acu_key,3)=data_(select,2);
        CombState(acu_key,4)=data_(select,1);
    case 11
        CombState(acu_key,1)=data_(select,2);
        CombState(acu_key,2)=data_(select,4);
        CombState(acu_key,3)=data_(select,3);
        CombState(acu_key,4)=data_(select,2);
    case 12
        CombState(acu_key,1)=data_(select,2);
        CombState(acu_key,2)=data_(select,5);
        CombState(acu_key,3)=data_(select,4);
        CombState(acu_key,4)=data_(select,3);
    case 13
        CombState(acu_key,1)=data_(select,2);
        CombState(acu_key,2)=data_(select,6);
        CombState(acu_key,3)=data_(select,5);
        CombState(acu_key,4)=data_(select,4);
    case 14
        CombState(acu_key,1)=data_(select,2);
        CombState(acu_key,2)=data_(select,6);
        CombState(acu_key,3)=data_(select,6);
        CombState(acu_key,4)=data_(select,5);
    case 15
        CombState(acu_key,1)=data_(select,2);
        CombState(acu_key,2)=data_(select,6);
        CombState(acu_key,3)=data_(select,6);
        CombState(acu_key,4)=data_(select,6);
        
    case 16
        CombState(acu_key,1)=data_(select,3);
        CombState(acu_key,2)=data_(select,1);
        CombState(acu_key,3)=data_(select,1);
        CombState(acu_key,4)=data_(select,1);
    case 17
        CombState(acu_key,1)=data_(select,3);
        CombState(acu_key,2)=data_(select,2);
        CombState(acu_key,3)=data_(select,1);
        CombState(acu_key,4)=data_(select,1);
    case 18
        CombState(acu_key,1)=data_(select,3);
        CombState(acu_key,2)=data_(select,3);
        CombState(acu_key,3)=data_(select,2);
        CombState(acu_key,4)=data_(select,1);
    case 19
        CombState(acu_key,1)=data_(select,3);
        CombState(acu_key,2)=data_(select,4);
        CombState(acu_key,3)=data_(select,3);
        CombState(acu_key,4)=data_(select,2);
    case 20
        CombState(acu_key,1)=data_(select,3);
        CombState(acu_key,2)=data_(select,5);
        CombState(acu_key,3)=data_(select,4);
        CombState(acu_key,4)=data_(select,3);
    case 21
        CombState(acu_key,1)=data_(select,3);
        CombState(acu_key,2)=data_(select,6);
        CombState(acu_key,3)=data_(select,5);
        CombState(acu_key,4)=data_(select,4);
    case 22
        CombState(acu_key,1)=data_(select,3);
        CombState(acu_key,2)=data_(select,6);
        CombState(acu_key,3)=data_(select,6);
        CombState(acu_key,4)=data_(select,5);
    case 23
        CombState(acu_key,1)=data_(select,3);
        CombState(acu_key,2)=data_(select,6);
        CombState(acu_key,3)=data_(select,6);
        CombState(acu_key,4)=data_(select,6);
        
    case 24
        CombState(acu_key,1)=data_(select,4);
        CombState(acu_key,2)=data_(select,1);
        CombState(acu_key,3)=data_(select,1);
        CombState(acu_key,4)=data_(select,1);
    case 25
        CombState(acu_key,1)=data_(select,4);
        CombState(acu_key,2)=data_(select,2);
        CombState(acu_key,3)=data_(select,1);
        CombState(acu_key,4)=data_(select,1);
    case 26
        CombState(acu_key,1)=data_(select,4);
        CombState(acu_key,2)=data_(select,3);
        CombState(acu_key,3)=data_(select,2);
        CombState(acu_key,4)=data_(select,1);
    case 27
        CombState(acu_key,1)=data_(select,4);
        CombState(acu_key,2)=data_(select,4);
        CombState(acu_key,3)=data_(select,3);
        CombState(acu_key,4)=data_(select,2);
    case 28
        CombState(acu_key,1)=data_(select,4);
        CombState(acu_key,2)=data_(select,5);
        CombState(acu_key,3)=data_(select,4);
        CombState(acu_key,4)=data_(select,3);
    case 29
        CombState(acu_key,1)=data_(select,4);
        CombState(acu_key,2)=data_(select,6);
        CombState(acu_key,3)=data_(select,5);
        CombState(acu_key,4)=data_(select,4);
    case 30
        CombState(acu_key,1)=data_(select,4);
        CombState(acu_key,2)=data_(select,6);
        CombState(acu_key,3)=data_(select,6);
        CombState(acu_key,4)=data_(select,5);
    case 31
        CombState(acu_key,1)=data_(select,4);
        CombState(acu_key,2)=data_(select,6);
        CombState(acu_key,3)=data_(select,6);
        CombState(acu_key,4)=data_(select,6);
        
    case 32
        CombState(acu_key,1)=data_(select,5);
        CombState(acu_key,2)=data_(select,1);
        CombState(acu_key,3)=data_(select,1);
        CombState(acu_key,4)=data_(select,1);
    case 33
        CombState(acu_key,1)=data_(select,5);
        CombState(acu_key,2)=data_(select,2);
        CombState(acu_key,3)=data_(select,1);
        CombState(acu_key,4)=data_(select,1);
    case 34
        CombState(acu_key,1)=data_(select,5);
        CombState(acu_key,2)=data_(select,3);
        CombState(acu_key,3)=data_(select,2);
        CombState(acu_key,4)=data_(select,1);
    case 35
        CombState(acu_key,1)=data_(select,5);
        CombState(acu_key,2)=data_(select,4);
        CombState(acu_key,3)=data_(select,3);
        CombState(acu_key,4)=data_(select,2);
    case 36
        CombState(acu_key,1)=data_(select,5);
        CombState(acu_key,2)=data_(select,5);
        CombState(acu_key,3)=data_(select,4);
        CombState(acu_key,4)=data_(select,3);
    case 37
        CombState(acu_key,1)=data_(select,5);
        CombState(acu_key,2)=data_(select,6);
        CombState(acu_key,3)=data_(select,5);
        CombState(acu_key,4)=data_(select,4);
    case 38
        CombState(acu_key,1)=data_(select,5);
        CombState(acu_key,2)=data_(select,6);
        CombState(acu_key,3)=data_(select,6);
        CombState(acu_key,4)=data_(select,5);
    case 39
        CombState(acu_key,1)=data_(select,5);
        CombState(acu_key,2)=data_(select,6);
        CombState(acu_key,3)=data_(select,6);
        CombState(acu_key,4)=data_(select,6);
        
    case 40
        CombState(acu_key,1)=data_(select,6);
        CombState(acu_key,2)=data_(select,1);
        CombState(acu_key,3)=data_(select,1);
        CombState(acu_key,4)=data_(select,1);
    case 41
        CombState(acu_key,1)=data_(select,6);
        CombState(acu_key,2)=data_(select,2);
        CombState(acu_key,3)=data_(select,1);
        CombState(acu_key,4)=data_(select,1);
    case 42
        CombState(acu_key,1)=data_(select,6);
        CombState(acu_key,2)=data_(select,3);
        CombState(acu_key,3)=data_(select,2);
        CombState(acu_key,4)=data_(select,1);
    case 43
        CombState(acu_key,1)=data_(select,6);
        CombState(acu_key,2)=data_(select,4);
        CombState(acu_key,3)=data_(select,3);
        CombState(acu_key,4)=data_(select,2);
    case 44
        CombState(acu_key,1)=data_(select,6);
        CombState(acu_key,2)=data_(select,5);
        CombState(acu_key,3)=data_(select,4);
        CombState(acu_key,4)=data_(select,3);
    case 45
        CombState(acu_key,1)=data_(select,6);
        CombState(acu_key,2)=data_(select,6);
        CombState(acu_key,3)=data_(select,5);
        CombState(acu_key,4)=data_(select,4);
    case 46
        CombState(acu_key,1)=data_(select,6);
        CombState(acu_key,2)=data_(select,6);
        CombState(acu_key,3)=data_(select,6);
        CombState(acu_key,4)=data_(select,5);
    case 47
        CombState(acu_key,1)=data_(select,6);
        CombState(acu_key,2)=data_(select,6);
        CombState(acu_key,3)=data_(select,6);
        CombState(acu_key,4)=data_(select,6);
    otherwise
        disp('ERROR TO GENERATE A NEW COMBINATION');
        
end

end

