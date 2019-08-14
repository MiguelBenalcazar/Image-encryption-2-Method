function Symbol = Base32_RFC( Value)
%receive the numerical value that represents the RFC 4648 Base32 alphabet
%from numbers to letters
switch Value
    case 0
        Symbol='A';
    case 1
        Symbol='B';
    case 2
        Symbol='C';
    case 3
        Symbol='D';
    case 4
        Symbol='E';
    case 5
        Symbol='F';
    case 6
        Symbol='G';
    case 7
        Symbol='H';
    case 8
        Symbol='I';
    case 9
        Symbol='J';
    case 10
        Symbol='K';
    case 11
        Symbol='L';
    case 12
        Symbol='M';
    case 13
        Symbol='N';
    case 14
        Symbol='O';
    case 15
        Symbol='P';
    case 16
        Symbol='Q';
    case 17
        Symbol='R';
    case 18
        Symbol='S';
    case 19
        Symbol='T';
    case 20
        Symbol='U';
    case 21
        Symbol='V';
    case 22
        Symbol='W';
    case 23
        Symbol='X';
    case 24
        Symbol='Y';
    case 25
        Symbol='Z';
    case 26
        Symbol='2';
    case 27
        Symbol='3';
    case 28
        Symbol='4';
    case 29
        Symbol='5';
    case 30
        Symbol='6';
    case 31
        Symbol='7';
    otherwise
        disp('ERROR');

end

