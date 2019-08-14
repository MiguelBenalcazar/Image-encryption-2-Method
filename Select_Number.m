function [ CombState  ] = Select_Number( input,data_,select)
%this function return the combination required by the system

acu_key=1;
switch input                                                               %To select key
    case 0
        CombState(acu_key,1)=data_(select,1);
        CombState(acu_key,2)=data_(select,2);
        CombState(acu_key,3)=data_(select,3);
        CombState(acu_key,4)=data_(select,4);
    case 1
        CombState(acu_key,1)=data_(select,1);
        CombState(acu_key,2)=data_(select,2);
        CombState(acu_key,3)=data_(select,3);
        CombState(acu_key,4)=data_(select,5);
    case 2
        CombState(acu_key,1)=data_(select,1);
        CombState(acu_key,2)=data_(select,2);
        CombState(acu_key,3)=data_(select,3);
        CombState(acu_key,4)=data_(select,6);
    case 3
        CombState(acu_key,1)=data_(select,1);
        CombState(acu_key,2)=data_(select,2);
        CombState(acu_key,3)=data_(select,4);
        CombState(acu_key,4)=data_(select,5);
    case 4
        CombState(acu_key,1)=data_(select,1);
        CombState(acu_key,2)=data_(select,2);
        CombState(acu_key,3)=data_(select,4);
        CombState(acu_key,4)=data_(select,6);
    case 5
        CombState(acu_key,1)=data_(select,1);
        CombState(acu_key,2)=data_(select,2);
        CombState(acu_key,3)=data_(select,5);
        CombState(acu_key,4)=data_(select,6);
    case 6
        CombState(acu_key,1)=data_(select,1);
        CombState(acu_key,2)=data_(select,3);
        CombState(acu_key,3)=data_(select,4);
        CombState(acu_key,4)=data_(select,5);
    case 7
        CombState(acu_key,1)=data_(select,2);
        CombState(acu_key,2)=data_(select,3);
        CombState(acu_key,3)=data_(select,4);
        CombState(acu_key,4)=data_(select,6);
    case 8
        CombState(acu_key,1)=data_(select,1);
        CombState(acu_key,2)=data_(select,3);
        CombState(acu_key,3)=data_(select,5);
        CombState(acu_key,4)=data_(select,6);
    case 9
        CombState(acu_key,1)=data_(select,1);
        CombState(acu_key,2)=data_(select,4);
        CombState(acu_key,3)=data_(select,5);
        CombState(acu_key,4)=data_(select,6);
    case 10
        CombState(acu_key,1)=data_(select,2);
        CombState(acu_key,2)=data_(select,3);
        CombState(acu_key,3)=data_(select,4);
        CombState(acu_key,4)=data_(select,5);
    case 11
        CombState(acu_key,1)=data_(select,2);
        CombState(acu_key,2)=data_(select,3);
        CombState(acu_key,3)=data_(select,4);
        CombState(acu_key,4)=data_(select,6);
    case 12
        CombState(acu_key,1)=data_(select,2);
        CombState(acu_key,2)=data_(select,3);
        CombState(acu_key,3)=data_(select,5);
        CombState(acu_key,4)=data_(select,6);
    case 13
        CombState(acu_key,1)=data_(select,2);
        CombState(acu_key,2)=data_(select,4);
        CombState(acu_key,3)=data_(select,5);
        CombState(acu_key,4)=data_(select,6);
    case 14
        CombState(acu_key,1)=data_(select,3);
        CombState(acu_key,2)=data_(select,4);
        CombState(acu_key,3)=data_(select,5);
        CombState(acu_key,4)=data_(select,6);
    otherwise
        disp('ERROR TO GENERATE A NEW COMBINATION');
        
end

end

