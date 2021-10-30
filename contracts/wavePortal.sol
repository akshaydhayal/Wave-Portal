// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
import"hardhat/console.sol";

contract WavePortal{
  uint totalWaves;
  //address lastAdd;
  constructor(){
    console.log("This is a smart Contract");
  }
  function wave() public{
    totalWaves=totalWaves+1;
    console.log("%s has waved to us!",msg.sender);
    //lastAdd=msg.sender;
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

//Old WavePortal address:  0x9f4d4842f57Cc757F08be2889a7A30fFa9aAC167

//Old WavePortal address:  0x68aC3851e3F39B0D115A20A61cD23016164436Ab