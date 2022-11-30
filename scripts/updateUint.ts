import Web3 from 'web3'
import { Contract, ContractSendMethod, Options } from 'web3-eth-contract'

(async () => {
    const address = '0xd9145CCE52D386f254917e481eB44e9943F39138';
    const abiArray = [
	{
		"inputs": [],
		"name": "getMyUnit",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "myUint",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "newUint",
				"type": "uint256"
			}
		],
		"name": "setMyUint",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	}
];

    const contractInstance = new Contract(abiArray, address);

    console.log(await contractInstance.methods.setMyUint().call());
})