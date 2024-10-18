// This JavaScript code helps Flutter connect with SubWallet via injected Web3 providers

async function connectToSubWallet() {
  if (window.injectedWeb3 && window.injectedWeb3['subwallet-js']) {
    const provider = window.injectedWeb3['subwallet-js'];
    await provider.enable();
    return provider;
  } else {
    throw "SubWallet not found";
  }
}
