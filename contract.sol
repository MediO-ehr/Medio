//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

// // contract Fallback{
// //     fallback() external payable{
// //         if(msg.value < 0.2 Ether){
// //             revert('');
// //         }
// //     }
// // }


// // This contract keeps all Ether sent to it with no way
// // to get it back.
// contract HelloWorld {
//     event Received(address, uint);
//     receive() external payable {
//         emit Received(msg.sender, msg.value);
//     }
// }

contract Eth_payable{
    struct UserInfo{
        address userAddress;
        string name;
        string phoneNumber;
        string email;
    }

    mapping(address => UserInfo) private users;
    address[] private userAddresses;
    
    //Defining an event...
    event Eth_pay(address indexed userAddress, string name, string phoneNumber, string email);

    //Deposition
    function deposite() external payable {
        require(msg.value >= 0.01 ether, "error value below 0.01 ether");
        UserInfo storage user = users[msg.sender];//Storage is persistent
        user.userAddress = msg.sender;
        emit Eth_pay(msg.sender, user.name, user.email, user.phoneNumber);

    }
    
    //Data entry
    function UserRegistry(string memory name, string memory email, string memory phoneNumber) public{
        UserInfo storage user = users[msg.sender];
        user.name = name;
        user.email = email;
        user.phoneNumber = phoneNumber;
        if (user.userAddress == address(0)) {
            user.userAddress = msg.sender;
            userAddresses.push(msg.sender);
        }
        emit Eth_pay(msg.sender, user.name, user.phoneNumber, user.email );
    }
    function getUser(address userAddress) public view returns (string memory name, string memory phoneNumber, string memory email) {
        UserInfo storage user = users[userAddress];
        return (user.name, user.phoneNumber, user.email);
    }

    function getAllUsers() public view returns (address[] memory) {
        return userAddresses;
    }

}