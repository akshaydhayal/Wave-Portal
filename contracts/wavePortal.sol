// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
import"hardhat/console.sol";

contract WavePortal{
  uint totalWaves;
  uint256 private seed;

  //address lastAdd;
  event NewWave(address indexed from, uint256 timestamp, string message);

  struct Wave{
      address waver; // The address of the user who waved.
      string message; // The message the user sent.
      uint256 timestamp; // The timestamp when the user waved.
  }
  Wave [] waves;

  //This is an address => uint mapping, meaning I can associate an address with a number! In this case, I'll be storing the address with the last time the user waved at us.
  mapping(address => uint256) public lastWavedAt;

  constructor() payable{
    console.log("This is a smart Contract");
    //Set the initial seed
    seed = (block.timestamp + block.difficulty) % 100;
  }

  function wave(string memory _message) public{
    //We need to make sure the current timestamp is at least 15-minutes bigger than the last timestamp we stored
   require(lastWavedAt[msg.sender] + 30 seconds < block.timestamp, "Must wait 30 seconds before waving again.");
    //Update the current timestamp we have for the user
    lastWavedAt[msg.sender] = block.timestamp;

    totalWaves=totalWaves+1;
    console.log("%s has waved to us!",msg.sender);
    waves.push(Wave(msg.sender,_message,block.timestamp));
    //Generate a new seed for the next user that sends a wave
    seed = (block.difficulty + block.timestamp + seed) % 100;

    //Give a 50% chance that the user wins the prize.
    if (seed <= 50) {
      console.log("%s won!", msg.sender);

    //The same code we had before to send the prize.
    uint256 prizeAmount = 0.0001 ether;
    require(prizeAmount <= address(this).balance,"Trying to withdraw more money than the contract has."
            );
            (bool success, ) = (msg.sender).call{value: prizeAmount}("");
            require(success, "Failed to withdraw money from contract.");
        }
    emit NewWave(msg.sender, block.timestamp, _message);
    //lastAdd=msg.sender;
  }
  //I added a function getAllWaves which will return the struct array, waves, to us.This will make it easy to retrieve the waves from our website!
  function getAllWaves() public view returns(Wave [] memory){
    return waves;
  }

  // function getTotalWaves() public view returns(uint,address){
  //   console.log("We have %d total waves",totalWaves);
  //   console.log("last address :",lastAdd);
  //   return (totalWaves,lastAdd);
  // }

  //New function
  function getTotalWaves() public view returns(uint){
    console.log("We have %d total waves",totalWaves);
    return totalWaves;
  }
}

//Old(1.0) WavePortal Contract address:  0x9f4d4842f57Cc757F08be2889a7A30fFa9aAC167

//New(1.1) WavePortal Contract address:  0x68aC3851e3F39B0D115A20A61cD23016164436Ab

//New(1.2) WavePortal Contract address: 0x851EE537280e7F3B94Ebe487fbe6423a7589b941

//New(1.3) Contract(adding Fund contract, set a prize):0x7100819f3bd29f2Cde7CE9c28913E226a2D5827A

//New(1.3) Contract(adding Fund contract, set a prize):0x3A3C0e35976E5888Bf808855945431420142eEce