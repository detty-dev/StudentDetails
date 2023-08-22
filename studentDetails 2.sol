/ SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;
import "./studentDetails2
sol";

contract studentDetailsFactory{

    studentDetail[] Details;

    function createStudentDetails() external returns (studentDetail newDetails) {
     newDetails = new studentDetail(msg.sender);
     Details.push(newDetails);
    }
}