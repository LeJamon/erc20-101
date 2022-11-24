pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract XpGzb is ERC20 {

    mapping (address=>uint8) AllowedUser;
   
    //constructor() ERC20("XpGzb", "XpGzb") public {
       // _mint(address(this), 594727662000000000000000000);
    //}

    constructor(string memory name, string memory symbol,uint256 initialSupply) public ERC20(name, symbol) {
        _mint(msg.sender, initialSupply);
       
    }

    function getToken() public{
        _transfer(address(this),msg.sender,1000); // moins de gas fee 
    }

    function buyToken() public payable {
        require(AllowedUser[msg.sender]!=0, "You are not whitelisted");
        if(AllowedUser[msg.sender]==1){
        _transfer(address(this),msg.sender,msg.value*10);
        }
        if(AllowedUser[msg.sender]==2){
        _transfer(address(this),msg.sender,msg.value*20);
        }
    }
    
    function allowAddressTier1() public{
        AllowedUser[msg.sender]=1; 
    }

    function allowAddressTier2() public{
        AllowedUser[msg.sender]=2; 
    }

    /*function completeWorkshop(){
        
    }*/
    
}