// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

/*Data location
Khi khai báo biến sẽ có 3 nơi để lưu trữ (tùy trường hợp):
- storage: state variable (được lưu trữ trên mạng lưới blockchain, tồn tại mãi mãi trên mạng)
- memory: lưu trong bộ nhớ tạm RAM, chỉ tồn tại trong khoảng thời gian function được gọi
- calldata: tương tự như memory, nó chỉ được dùng trong parameter của function, và thường là external

*/

contract DataLocation {
    uint256[] public arr; //storage

    function f1(string memory x, string calldata y) public {
        _f(arr, x, y);
    }

    function f2(string memory a) public {

    }

    //function nhận vào 3 tham số với các kiểu data location
    function _f(
        uint256[] storage _arr,
        string memory _x,
        string calldata _y
    ) internal {}

    //từ khóa internal: là những hàm chỉ được gọi ở trong contract
    //các function dạng public thì parameter chỉ khai báo kiểu dữ liệu là memory hoặc calldata

    function _f2(string memory _a) internal  {

    }

    //muốn lưu giá trị của người dùng truyền vào vào trong storage thì làm như sau:
    string public save;
    function f3(string memory _save) public {
        save = _save;
    }
}
