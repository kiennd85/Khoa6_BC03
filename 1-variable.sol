// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;


contract FirstContract {
    //solidity là ngôn ngữ static type language tức là cần khai báo kiểu dữ liệu cho biến

    //========================================================
    //kiểu string
    string public a = "Hello world";

    //kiểu number
    //số nguyên: int8 - int256
    //số nguyên dương: uint8 - uint256
    //các toán tử + - / * **
    //không thực hiện được phép toán với 2 kiểu dữ liệu khác nhau
    //kiểu số không có kiểu float, bởi vì dùng dấu chấm động tốn tài nguyên
    int public number =  1;
    uint8 public number2 = 255;

    //kiểu boolean
    bool public isSuperMan = true; //false

    //kiểu dữ liệu array:
    //- trong array, kiểu dữ liệu phải giống nhau
    //- không nên sử dụng quá nhiều trong solidity vì max size của array là 2^256-1 phần tử 
    //- dynamic memory array: array động, khả năng đọc chậm, và tốn tài nguyên
    uint256 [] public listNumber = [1,2,3];
    string [] public listString = ['a','b','c'];
    bool[] public failOrPass = [true, false];

    //mapping - (key:value), phải khai báo kiểu dữ liệu của key và value
    //mục đích sử dụng: lưu ví
    //mapping lưu theo kiểu not iterable (không tuần tự), truy xuất ngẫu nhiên, và nhanh, tối ưu cho lưu trữ
    mapping (string => uint8) public scores;


    //constant, dữ liệu không thay đổi, viết hoa toàn bộ tên biến (uppercase)
    int public constant PI = 314;

    //kiểu dữ liệu address, băt đầu là 0x 
    address public wallet = 0xd9145CCE52D386f254917e481eB44e9943F39138; 
    //Ví dụ:
    mapping(address => uint256) public balances;


    //Giá trị default của các kiểu dữ liệu:
    //int : 0 (giá trị bằng 0)
    //string: "" (string rỗng)
    //bool: false (bool mặc định là false)
    //arrary[]: là giá trị mặc định của kiểu dữ liệu bên trong array
    //address: 0x0000000000000000000
    // enum, struct: 




    //khái niệm bội số để xử lý dấu chậm động trong solidity
    
    //========================================================
    //BAI TAP VE NHA
    /* khai báo : 4 biến 
        - lãi suất theo tháng
        - tiền gửi
        - số tháng gửi
        - tổng tiền cả gốc và lãi nhận được sau n tháng tháng gửi (tính theo lãi kép)
    
    để sủ dụng số thực, giả định các số sử dụng là bội số của 1000000
    */
    

    /* 
    Calculate total amount using compound interest formula
     A = P * (1 + r/100)^n
    Where:
    - A is the total amount after n months,
    - P is the principal amount (initial deposit),
    - r is the monthly interest rate (in percentage),
    - n is the number of months.
    */
    
    // uint public decimals = 1000000;
    
    // uint public interest = 500000; //lãi theo tháng
    // uint public deposit = 100*decimals; //100u
    // uint public months = 5*decimals; 

    // uint public total = deposit + deposit * interest / 100 * decimals;
    //uint public total = deposit * (1 + interest/100)**months;

    //total = deposit + deposit * interest / 100 * decimals;

    //Giải bài tập trên lớp
    //dùng bội số 100
    // uint256 public lai = 10;  //1-100 don vi % 
    // uint256 public tienGui = 1500000; //boi so 100
    // uint256 public  soThang = 12;

    // uint256 public total = tienGui * ()

}