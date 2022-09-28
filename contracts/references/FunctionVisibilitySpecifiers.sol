// SPDX-License-Identifier: MIT

pragma solidity 0.8.17.0;

contract FunctionVisibilitySpecifiers {
    int public x = 10;
    int private y = 20;

    function getY() public view returns(int) {
        return y;
    }

    function privateFunction() private view returns(int) {
        return x;
    }

    function getPrivateFunction() public view returns(int) {
        return privateFunction();
    }

    function internalFunction() internal view returns(int) {
        return x;
    }

    function getInternalFunction() public view returns(int) {
        return internalFunction();
    }

    // Can only be called from external contracts and not internally from the contract it belongs to.
    function externalFunction() external view returns(int) {
        return x;
    }

    // This will generate an error because external contracts cannot be called from within the contract
    // it was written in.
    function getExternalFunction() public view returns(int) {
        // return externalFunction();
    }
}

contract InheritedContract is FunctionVisibilitySpecifiers {
    int public _x = internalFunction();
    // This will generate an error because privateFunction() in FunctionVisibilitySpecifiers contract is private and for that contract only.
    // int public callPrivateFunction = privateFunction();

    // This will also generate and
    function retrieveExternalFunction() public view returns(int) {
        // return externalFunction();
    }
}

contract CallContract {
    FunctionVisibilitySpecifiers _externalContract = new FunctionVisibilitySpecifiers();
    InheritedContract _inheritedContract = new InheritedContract();

    function callExternalContract() public view returns(int) {
        return _externalContract.externalFunction();
    }

    function callInheritedContract() public view returns(int) {
        return _inheritedContract.externalFunction();
    }
}