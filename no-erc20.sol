// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Token {
    mapping (address => uint) public balances;
    mapping (address => mapping (address => uint)) allowances;

    //Tổng cung vào thị trường
    uint public totalSupply;

    address public foundation;

    string public name = "LUAGA";

    constructor() {
        foundation = msg.sender;
        totalSupply = 1000000000;
        balances[foundation] = totalSupply;
    }

    function transfer(address _to, uint _value) public  {
        require(balances[msg.sender] >= _value);
        balances[_to] += _value;
        balances[msg.sender] -= _value;

    }
    //https://eips.ethereum.org/erc

    //BTVN
    //cấp quyền tín dụng approve (cấp tín dụng 100 token
    
    //allowance (check hạn mức còn lại)

    //hàm chuyển tiền từ hạn mức
    
    //=================================

    //anh X cấp cho anh Y1, Y2, Y3... số tiền Z1, Z2, Z3... để tiêu dùng
    function approve(address _spender, uint _value) public {
        //check số dư phải lớn hơn 
        require(balances[msg.sender] >= _value);

        //cấp tín dụng cho anh spender
        allowances[msg.sender][_spender] = _value;

        //giảm số dư của người dùng
        //balances[msg.sender] -= _value;

    }

    function transferFrom (address _from, address _to, uint _value) public  {
        //số tiền tín dụng còn không
        require(allowances[_from][msg.sender] >= _value);

        //check tài khoản thực
        require(balances[_from] >= _value);

        //chuyển tiền tới _to
        balances[_to] += _value;

        //giảm số dư tín dụng 
        allowances[_from][msg.sender] -= _value;
    }

}

//https://gist.github.com/hashcott/1686dc9952c189d6f1615fb999036a3a