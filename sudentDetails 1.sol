// SPDX-License-Identifier: MIT
pragma solidity ^ 0.8.21;

// A record of student in a university allows only principal to admit, expell.

contract studentDetail {
     address public principal;
     address public Deployer;

     struct Student {
         string name;
         uint age;
         string gender;
     }
        uint id;

    mapping(uint => Student) _student;

    event Admitted(string indexed _name, string _gender, uint _age, uint _id);

     constructor(address _prin) {
         principal = _prin;
         Deployer = msg.sender;

     }
     modifier onlyOwner {
         require(msg.sender == principal, "Not principle");
         _;
     }
    function admitStudent(string memory _name, uint _age, string memory _gender) external onlyOwner {
        id = id + 1;
        // uint _id = id;
        Student storage newStudent = _student[id];
        newStudent.name = _name;
        newStudent.age = _age;
        newStudent.gender = _gender;
        emit Admitted(_name, _gender, _age, id);

    }
    function expell(uint _id) external onlyOwner {
        // Student storage newStudent = _student[_id];
        delete _student[_id];
    }
    function getStudentDetails(uint _id) external view returns(Student memory _s)  {
        _s = _student[_id];
    }
}

