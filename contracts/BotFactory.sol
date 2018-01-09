pragma solidity ^0.4.17;

contract BotFactory {

    event NewBot(uint botID, uint dna);
    event StartBattle(uint botID);

    function BotFactory() public {
       botIndex = 0;
   }

   uint public botIndex;

   struct Bot {
        uint id;
        uint64 age; // timestamp of the block when the bot was born
        uint256 genes; // genes that makeup the bot's aesthetic
        uint64 energy; // power to battle another bot
        uint64 reputation; // overall game success
    }

    Bot[] public bots;

    mapping (uint => address) public botToOwner;
    mapping (address => uint) public ownerToBot;
    mapping (address => uint) ownerBotCount; // (owner address => num bots they own)

    function _createBot(uint _dna) internal returns (uint) {
        uint id = bots.push(Bot(botIndex, uint64(now), _dna, 1000, 0)) - 1;
        botIndex++;
        botToOwner[id] = msg.sender;
        ownerToBot[msg.sender] = id;
        ownerBotCount[msg.sender]++;
        NewBot(id, _dna);
        return id; 
    }

    function scanBotEnergy(uint id) public view returns(uint64){
        uint64 energy = bots[id].energy;
        return energy;
    } 
}