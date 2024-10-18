import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';  // For making web requests

// from chatGPT, requires versioning
void useSubWallet() async {
  final client = Web3Client("https://rpc.polkadot.io", Client());

  // You can now interact with the blockchain using web3dart

  // For example, get the balance of an account
  EthereumAddress address = EthereumAddress.fromHex("YOUR_ACCOUNT_ADDRESS");
  EtherAmount balance = await client.getBalance(address);
  print("Balance: ${balance.getValueInUnit(EtherUnit.ether)} ETH");
}

void useTalismanProvider() async {
  final client = Web3Client("https://rpc.polkadot.io", Client());

  // Now you can interact with the blockchain

  // For example, get the balance of an account
  EthereumAddress address = EthereumAddress.fromHex("YOUR_ACCOUNT_ADDRESS");
  EtherAmount balance = await client.getBalance(address);
  print("Balance: ${balance.getValueInUnit(EtherUnit.ether)} ETH");
}