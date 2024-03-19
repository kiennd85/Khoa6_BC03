// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Wallet {

    //address to owner
    address public owner;
    uint256 public balance;

    //global variable (biến global): msg

    // constructor là option function
    // khi contract được tạo ra, constructor sẽ chạy đầu tiên

    constructor() {
        // initial state
        owner = msg.sender;
        //balance = _b;
    }


    //keyword payable: hàm thực thi thanh toán một cách tự động
    //khi deploy contract, contract sinh ra hàm deposit, 
    //hàm này tự động nhận địa chỉ contract làm địa chỉ nhận
    
    // 1 eth == 10^18 wei
    // 1 eth = 1e18 
    // 1 wei == 1
    
    function deposit() public payable  {

    }

    //have withdraw
    function withdraw(uint256 _token) public {
        //check _token > 0 
        //check số dư

        require(_token > 0,"Must have greater than 0");
        require(address(this).balance >= _token, "Tham lam" ); //từ khóa this đại diện cho contract
        
        // 3 cách rút tiền
        // xác định người nhận

        //Cách 1:
        //đơn vị chuyển là wei
        //payable(owner).transfer(_token);
        //hàm này chạy xong thì không trả gì về vì vậy không recommend sử dụng

        //Cách 2:
        // bool sent = payable(owner).send(_token); // tiêu tốn 230 gas
        // require(sent,"Fail to send Ether");

        //Cách 3: được recommend sử dụng nhiều nhất, tối ưu phí gas
        (bool sent, bytes memory data) = payable(owner).call{value: _token}("");
        require(sent,"Fail to send Ether");


    }

}

