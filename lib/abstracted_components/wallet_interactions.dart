import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';  // For making web requests

final String AZEROTESTNET = 'https://rpc.alephzero-testnet.gelato.digital';

// from chatGPT, requires versioning
void useSubWallet() async {
  final client = Web3Client("https://rpc.polkadot.io", Client());

  // You can now interact with the blockchain using web3dart

  // For example, get the balance of an account
  EthereumAddress address = EthereumAddress.fromHex("YOUR_ACCOUNT_ADDRESS");
  EtherAmount balance = await client.getBalance(address);
  print("Balance: ${balance.getValueInUnit(EtherUnit.ether)} ETH");
}

Future<String> useTalismanProvider() async {
  final client = Web3Client('https://rpc.azero.dev', Client());

  // Now you can interact with the blockchain

  // For example, get the balance of an account
  EthereumAddress address = EthereumAddress.fromHex('5GsH6Nt1XYenFs9dqzVBG878SeT9G9sQL66BaLn2PpdRniHa');
  EtherAmount balance = await client.getBalance(address);
  print("Balance: ${balance.getValueInUnit(EtherUnit.ether)} ETH");
  return("Balance: ${balance.getValueInUnit(EtherUnit.ether)} ETH");
}