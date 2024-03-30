// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Token {
    mapping (address => uint) public balances;
    mapping (address => mapping (address => uint)) allowances;

    //Tổng cung vào thị trường
    uint public totalSupply;

    address public foundation;

    string public name = "LUAGA";

    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    //thuộc tính indexed: 

    constructor() {
        foundation = msg.sender;
        totalSupply = 1000000000;
        balances[foundation] = totalSupply;
    }

    function transfer(address _to, uint _value) public  {
        require(balances[msg.sender] >= _value);
        balances[_to] += _value;
        balances[msg.sender] -= _value;

        emit Transfer(msg.sender, _to, _value);

    }
    //https://eips.ethereum.org/erc
   
    //=================================

    //anh X cấp cho anh Y1, Y2, Y3... số tiền Z1, Z2, Z3... để tiêu dùng
    function approve(address _spender, uint _value) public {
        //check msg.serder Khác _spender
        require(msg.sender != _spender, "msg.sender and _spender are the same");

        //check số dư phải lớn hơn 
        require(balances[msg.sender] >= _value);

        //cấp tín dụng cho spender
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

        //giảm số dư của _from
        balances[_from] -= _value;

    }


    //hàm check balance
    function balanceOf(address _addr) public view returns (uint) {
        return balances[_addr];
    }

    //hàm check allowence
    function allowance(address _from) public view returns (uint) {
        return allowances[_from][msg.sender];
    }

}

//https://gist.github.com/hashcott/1686dc9952c189d6f1615fb999036a3a

/*
logs sinh ra khi code thêm event/emit
[
	{
		"from": "0xb27A31f1b0AF2946B7F582768f03239b1eC07c2c",
		"topic": "0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef",
		"event": "Transfer",
		"args": {
			"0": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
			"1": "0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2",
			"2": "30",
			"_from": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
			"_to": "0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2",
			"_value": "30"
		}
	}
]

*/