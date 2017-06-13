pragma solidity ^0.4.0;

contract CustodialContract{
    
    address client;
    bool _switch = false;
    
    event UpdateStatus(string _msg);
    event UserStatus(string _msg, address user, uint _amount);
    function CustodialContract() {
        client = msg.sender;
    }
    
    modifier ifClient(){
        if(msg.sender != client){
            throw;
        }
        _;
    }
    
    function depositFunds()payable{
        UserStatus('user transferred some money', msg.sender, msg.value);
    }
    
    function witdrawFunds(uint amount) ifClient{
        if(client.send(amount)){
            UpdateStatus('user transferred some money');
            _switch = true;
        }
        else{
            _switch = false;
            
        }
    }
    
    function getFunds() constant returns(uint){
        UpdateStatus('Someone called a getter');
        return this.balance;
    }
}