// This JavaScript code helps Flutter connect with SubWallet via injected Web3 providers
// Import necessary libraries from Polkadot API
//import { web3Accounts } from '@polkadot/extension-dapp';

async function connectToSubWallet() {
  if (window.injectedWeb3 && window.injectedWeb3['subwallet-js']) {
    const SubWalletExtension = window.injectedWeb3['subwallet-js'];
    const extension = await SubWalletExtension.enable();

    console.log(extension.accounts.get);
    return extension;
  } else {
    throw "SubWallet not found";
  }
}

