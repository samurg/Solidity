pragma solidity ^0.4.0;

contract HellowWoldContract{
    string word = "Hellow wold";
    address issuer;
    
    function HelloWoldContract(){
        issuer = msg.sender;
    }
    
    modifier ifIssuer(){
         if(issuer != msg.sender){
            throw;
        }
        else{
            _;
        }
    }
    
    function getWord() returns(string){
        return word;
    }
    
    function setWord(string newWord) constant{
            word = newWord;
    }
}
