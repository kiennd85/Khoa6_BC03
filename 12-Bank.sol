// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

    //Lưu nhiều account
    //1 account gắn với 1 balances

contract Bank {

    mapping (address => uint256) public  balances;
    mapping (address => bool) public  accounts;

    function createWallet() public  {
        require(accounts[msg.sender] == false, "Account exist");
        accounts[msg.sender] = true;
        balances[msg.sender] = 0;

    }

    function deposit() public payable {
        require(accounts[msg.sender] == true, "Account not exist");
        balances[msg.sender] += msg.value;
    } 

    //payable có 2 luồng tự động 
    // - receive và fallback

    //transfer
    // 2 tham so: _to (địa chỉ nhận) , _value (so tien muon gui)
    // chi ai tao vi moi dc chuyen tien
    // can kiem tra cac dieu kien (list ra danh sach)

    function transfer(address _to, uint256 _value) public  payable {
        // kiểm tra tài khoản người gửi        
        // kiểm tra tài khoản người nhận
        // kiểm tra số dư trong tài khoản người gửi
        
        require(accounts[msg.sender] == true, "Sender not exist");
        require(accounts[_to] == true, "Receiver not exist");

        require(balances[msg.sender] >= _value, "Insufficient Funds" );

        balances[msg.sender] -= _value;
        balances[_to] += _value;

    }

    //btvn
    // tạo contract lottery
    // - mua vé, nhận một số có 2 chữ số random
    // - hàm roll (quay số) trả về một số 2 chữ số
    // - ví nào mua trung số đó thì nhận tiền

    


}