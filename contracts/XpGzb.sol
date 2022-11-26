pragma solidity ^0.6.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./IExerciceSolution.sol";
contract XpGzb is IExerciceSolution, ERC20 {

    mapping (address=>bool) AllowedUser;
    mapping (address=>uint8) TierListUser;
   
    constructor(string memory name, string memory symbol, uint initialSupply) ERC20(name, symbol) public {
        _mint(address(this), initialSupply);
        AllowedUser[address(0x7C5629d850eCD1E640b1572bC0d4ac5210b38FA5)]=true; 
        TierListUser[address(0x7C5629d850eCD1E640b1572bC0d4ac5210b38FA5)]=2; 
    }

    function symbol() public  view  override(IExerciceSolution,ERC20) returns (string memory){
        return("7bZpW");
        // problème de ticker , résolu en rappelant la fonction
    }
    
    function getToken() external override returns (bool){
        require(AllowedUser[msg.sender],"you are not whitelisted"); 
        _transfer(address(this),msg.sender,1000); // moins de gas fee
        return true; 
    }

    function buyToken() external override payable returns (bool){ 

        require(AllowedUser[msg.sender], "You are not whitelisted");
        require(msg.value>0,"you are not paying");
        if(TierListUser[msg.sender]==1){
        _transfer(address(this),msg.sender,msg.value*10);
        }
        if(TierListUser[msg.sender]==2){
        _transfer(address(this),msg.sender,msg.value*20);
        }
        return true; 
    }

    function isCustomerWhiteListed(address customerAddress) external override returns (bool){
        return AllowedUser[customerAddress];
    }

    function customerTierLevel(address customerAddress) external  override returns (uint256){
        return TierListUser[customerAddress];
    }
}