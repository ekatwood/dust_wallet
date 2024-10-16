// from chatGPT, requires versioning
import { ApiPromise, WsProvider } from '@polkadot/api';

async function connectAlephZeroNode() {
  // Aleph Zero has its own node endpoint
  const provider = new WsProvider('wss://ws.azero.dev'); // Replace with Aleph Zero's WebSocket endpoint

  // Create the API instance
  const api = await ApiPromise.create({ provider });

  // Once the API is ready, you can use it to interact with Aleph Zero's blockchain
  console.log('Connected to Aleph Zero node');
}

// Initialize the connection to the wallet and node
connectAlephZeroWallet();
connectAlephZeroNode();
