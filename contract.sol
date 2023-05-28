//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract Eth_payable{
    struct UserInfo{
        address userAddress;
        string name;
        string phoneNumber;
        string email;
        string medicalHistory;
    }

    mapping(address => UserInfo) private users;
    address[] private userAddresses;
    
    //Defining an event...
    event Eth_pay(address indexed userAddress, string name, string phoneNumber, string email, string medicalHistory);

    //Deposition
    function deposite() external payable {
        require(msg.value >= 0.01 ether, "error value below 0.01 ether");
        UserInfo storage user = users[msg.sender];//Storage is persistent
        user.userAddress = msg.sender;
        emit Eth_pay(msg.sender, user.name, user.email, user.phoneNumber, user.medicalHistory);

    }
    
    //Data entry
    function UserRegistry(string memory name, string memory email, string memory phoneNumber, string memory medicalHistory) public{
        UserInfo storage user = users[msg.sender];
        user.name = name;
        user.email = email;
        user.phoneNumber = phoneNumber;
        user.medicalHistory = medicalHistory;
        if (user.userAddress == address(0)) {
            user.userAddress = msg.sender;
            userAddresses.push(msg.sender);
        }
        emit Eth_pay(msg.sender, user.name, user.phoneNumber, user.email, user.medicalHistory);
    }
    function getUser(address userAddress) public view returns (string memory name, string memory phoneNumber, string memory email, string memory medicalHistory) {
        UserInfo storage user = users[userAddress];
        return (user.name, user.phoneNumber, user.email, user.medicalHistory);
    }

    function getAllUsers() public view returns (address[] memory) {
        return userAddresses;
    }

}