 // SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
import"hardhat/console.sol";

contract WavePortal{
  uint totalWaves;
  //address lastAdd;
  event NewWave(address indexed from, uint256 timestamp, string message);

  struct Wave{
      address waver; // The address of the user who waved.
      string message; // The message the user sent.
      uint256 timestamp; // The timestamp when the user waved.
  }
  Wave [] waves;

  constructor(){
    console.log("This is a smart Contract");
  }

  function wave(string memory _message) public{
    totalWaves=totalWaves+1;
    console.log("%s has waved to us!",msg.sender);
    waves.push(Wave(msg.sender,_message,block.timestamp));

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