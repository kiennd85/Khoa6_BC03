// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;


contract MappingAndStruct {


    //1.MAPPING
    // //Ví dụ Sử dụng mapping key => value

    // //mapping from address to uint balance
    // mapping(address => uint256) public wallets;

    // //create wallet, với các params nội tại sẽ thêm gạch chân
    // function create(address _addr) public {
    //     wallets[_addr] = 0;
    // }

    // //get balance
    // function get(address _addr) public view returns (uint256) {
    //     return wallets[_addr];
    // }

    // //send to wallet
    // function send(address _addr, uint256 coin) public {
    //     wallets[_addr] = coin;
    // }

    //2.STRUCT
    //struct, định nghĩa các thuộc tính của đối tượng
    //khai báo User dùng struct, với các thuộc tính như balance, name,...
    struct User {
        uint256 balances;
        string nickName;    
        bool isVIP;
    }
    //khai báo struct ở trên được gọi là khai báo kiểu dữ liệu, 
    //có thể hiểu giờ ta sẽ có kiểu dữ liệu User

    //để sử dụng khai báo biến mới với kiểu dữ liệu User
    //ví dụ: User public user = User(100,'proplayer',true);

    //khai báo kết hợp mapping với struct với ví dụ ở trên    
    mapping(address => User) public wallets;   

    //create wallet
    function create(address _addr, string memory _nick, bool _isVIP) public {
        wallets[_addr] = User(0, _nick, _isVIP);
    }

    //get balance
    function get(address _addr) public view returns (User memory) {
        return wallets[_addr];
    }

    //send to wallet
    function send(address _addr, uint256 coin) public {
        User memory user = wallets[_addr];
        user.balances = coin;
        wallets[_addr] = user;
    }
    //Thông thường không được truy cập trực tiếp vào mapping liên quan đến struct để sửa giá trị
    //mà phải gán vào một bộ nhớ tạm 

    


}