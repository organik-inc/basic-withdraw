// You need to add a license header here, to remove the warning on Remix.
pragma solidity ^0.8.0; // 
// Read this GPT prompt and keep going forward:
// https://chat.openai.com/share/f4918167-3d96-4427-8bfe-0a0e2370dc17

contract MyFirstTestContract {
    // Default variable that will be set on "contructor" and used later to allow access to some functions.
    address payable public owner; 
    
    // This is optional, but most block-scanners will display this information to the public.
    string public name = "Test Contract with Withdraw";

    constructor() {
        owner = payable(msg.sender);
    }
    
    // This empty function enables the contract to receive funds without any special efforts.
    receive() external payable {} 

    // A little redundancy never hurted anyone.
    fallback() external payable {} 
    
    function withdraw() external {
        // This step locks this function so only the owner or creator of this contract can interact with it.
        require(msg.sender == owner, "Only the contract owner can withdraw funds");
        uint256 contractBalance = address(this).balance;
        require(contractBalance > 0, "Contract balance is zero");
        // Transfer the contract balance to the owner
        owner.transfer(contractBalance);
    }
    
}
