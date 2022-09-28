// SPDX-License-Identifier: MIT

pragma solidity >=0.8.17;

// Globally accessible
struct Instructor {
    uint age;
    string name;
    address addr;
}

contract Academy {
    Instructor public academyInstructor;

    constructor(uint _age, string memory _name) {
        academyInstructor.age = _age;
        academyInstructor.name = _name;
        academyInstructor.addr = msg.sender;
    }

    function changeInstructor(uint _age, string memory _name, address _addr) public {
        academyInstructor.age = _age;
        academyInstructor.name = _name;
        academyInstructor.addr = _addr;
    }

    function differentApproachToChangeInstructor(uint _age, string memory _name, address _addr) public {
        Instructor memory inMemoryInstructor = Instructor({age: _age, name: _name, addr: _addr});

        academyInstructor = inMemoryInstructor;
    }
}

contract Wallet {
    PaymentReceived public payment;

    function PayContract() public payable {
        payment = new PaymentReceived(msg.sender, msg.value);
    }
}

contract PaymentReceived {
    address public from;
    uint public amount;

    constructor(address _from, uint _amount) {
        from = _from;
        amount = _amount;
    }
}

contract PaymentReceived2 {
    struct PaymentReceivedStruct {
        address from;
        uint amount;
    }
}

// Preferred options below because of the gas cost savings.
contract Wallet2 {
    // Good to save costs on gas when using structs.
    struct PaymentReceivedStruct {
        address from;
        uint amount;
    }

    PaymentReceivedStruct public payment;

    function payContract() public payable {
        //payment = PaymentReceivedStruct(msg.sender, msg.value);
        // OR
        payment.from = msg.sender;
        payment.amount = msg.value;
    }
}

// This contract inherits the PaymentReceived2 contract, that can then be used
// to access to public objects within the contract and there is no overhead
// in gas fees when using it this way.
contract Wallet3 is PaymentReceived2 {
    PaymentReceivedStruct public payment;

    function payContract() public payable {
        //payment = PaymentReceivedStruct(msg.sender, msg.value);
        // OR
        payment.from = msg.sender;
        payment.amount = msg.value;
    }
}

// Globally accessed.
struct PaymentReceivedStructNew {
    address from;
    uint amount;
}

// This approach uses slightly more gas.
contract Wallet4 {
    PaymentReceivedStructNew public payment;

    function payContract() public payable {
        payment = PaymentReceivedStructNew(msg.sender, msg.value);
    }
}

contract TestEnum {
    enum Status { Open, Closed, Unknown }
    Status public academyState = Status.Open;

    // Returns 0 regardless.
    function getEnum() public view returns(Status)  {
        if (academyState == Status.Open) {
            return Status.Open;
        }
        return Status.Unknown;
    }
}