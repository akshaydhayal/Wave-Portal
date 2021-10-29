// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
import"hardhat/console.sol";

contract WavePortal{
  uint totalWaves;
  address lastAdd;
  constructor(){
    console.log("This is a smart Contract");
  }
  function wave() public{
    totalWaves+=1;
    console.log("%s has waved to us!",msg.sender);
    lastAdd=msg.sender;
  }
 
  function getTotalWaves() public view returns(uint,address){
    console.log("We have %d total waves",totalWaves);
    console.log("last address :",lastAdd);
    return (totalWaves,lastAdd);
  }
}