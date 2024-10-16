// from chatGPT, requires versioning
import { web3Enable, web3Accounts } from '@polkadot/extension-dapp';

async function connectAlephZeroWallet() {
  // Enable the wallet extension (Aleph Zero Vault or others)
  const extensions = await web3Enable('Your DApp Name');

  if (extensions.length === 0) {
    // No extension installed, alert the user to install Aleph Zero Vault or other wallets
    console.log('No extension found');
    return;
  }

  // Get the accounts from the enabled wallet
  const accounts = await web3Accounts();

  if (accounts.length === 0) {
    // No accounts available
    console.log('No accounts found');
    return;
  }

  // Use the first account for simplicity
  const account = accounts[0];
  console.log('Connected account:', account.address);
}
