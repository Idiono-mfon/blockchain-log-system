// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.5.0 <0.9.0;

contract CBNLogContract {

    struct Log {
        bytes32 content;
        bytes32 size;
        bytes32 mime_type;
        uint256 date;
        bytes32 ip_address;
    }

    string public contractName; //Contract Name

    address public accessor; // privileged accessor's address

    Log [] private logs; //entire system logs forwarded to blockchain

    modifier isAuthenticated (address intiatorAddress){
        require(msg.sender == intiatorAddress, "Access denied!!");
        _;
    }

    constructor (string memory _contractName, address _defaultAddr)  {
            contractName = _contractName;
            accessor = _defaultAddr;
    }


    function setLogs (bytes32 _content,bytes32 _size, bytes32 _mime_type, uint256 _date, bytes32 _ip_address ) public isAuthenticated (accessor) {
        Log memory _log = Log (
            _content,
            _size,
            _mime_type,
            _date,
            _ip_address
        );
        logs.push(_log);
    }


    function getLogs() public view returns ( bytes32 [] memory _contents, bytes32 [] memory _sizes, bytes32 [] memory _mime_types, uint256 [] memory _dates, bytes32 [] memory _ip_addresses) {
        
        require(logs.length > 0, "Log files unavailable");
        _contents = new bytes32 [] (logs.length);

        _sizes = new bytes32 [] (logs.length);

        _mime_types = new bytes32 [] (logs.length);

        _dates = new uint256 [] (logs.length);

        _ip_addresses = new bytes32 [] (logs.length);

        for (uint i = 0; i < logs.length; i++) {
            _contents[i] = logs[i].content;
            _sizes[i] = logs[i].size;
            _mime_types[i] = logs[i].mime_type;
            _dates[i] = logs[i].date;
            _ip_addresses[i] = logs[i].ip_address;
        }

        return (_contents, _sizes, _mime_types, _dates, _ip_addresses);

    }

    


}