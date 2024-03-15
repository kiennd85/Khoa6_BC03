// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract CallMe {
    uint public pow = 2; //gọi là state variable, biến được lưu ở storage

    uint public num = 256;
    
    //function: khi return phải khai báo kiểu dữ liệu trả về

    //function state mutability: function có sử dụng biến từ bên ngoài hay không
    //- pure: không dùng biến bên ngoài
    function add(uint a, uint b) public pure returns (uint) {
        return a + b;
    }

    //- view: được dùng biến bên ngoài nhưng không được sửa
    function square1(uint a, uint b) public view returns (uint) {
        return (a + b)**pow;
    }

    //- nếu không dùng mutability thì có thể được dùng và được sửa biến bên ngoài
    function square2(uint a, uint b) public  returns (uint) {
        pow = 3;
        return (a + b)**pow;
    }  

    //return many
    function returnMany(string memory name) public pure returns (uint, bool, string memory) {
        return (256,true,name);
    }

    // kiểu dữ liệu string, khi dùng trong parameter hoặc giá trị trả về 
    // thì cần khai báo kèm theo từ khóa "memory"
    // Bởi vì trong solidity có 2 môi trường lưu trữ (data location):
    // - storage
    // - memory (lưu trữ trên ram), function thực hiện xong thì memory được giải phóng
    // storage và memory gọi là memory allocation 
    // - ngoài ra còn có calldata

    //vì sao chỉ có string mới khai báo từ khóa memory?
    // vì string là kiểu dữ liệu array of bytes
    // các array of bytes sẽ lưu các mã ascii
    //tóm lại string được định dang theo utf-8 -> ascii -> bytes


    //short return 
    function assigned() public pure returns (uint x, uint y) {
        x = 10;
        y = 11;
    }
    //khi biến x và y được gán thì function sẽ return



    //scope hoặc access modifier: phạm vi hoạt động
    
}