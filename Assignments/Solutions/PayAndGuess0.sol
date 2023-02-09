//by Alexander Kurz, Christopher Chang and Ronan Kearns
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract PayAndGuess0 {
    address payable public payer; 
    uint public paid;
    uint public fee;

    function doPay() public payable {
        payer = payable(msg.sender);
        paid = msg.value;
        //take fee from the amount paid and subtract it from the amount paid
        fee = paid / 100;
        paid = paid - fee;
    
    }

    function disburse() public {
        require(paid > 0, "Nothing to disburse.");
        address payable payee = payer;

        //disburse the amount paid to the payer
        payee.transfer(paid);

        //delete the payer
        delete payer;
        delete paid;

    }

}
