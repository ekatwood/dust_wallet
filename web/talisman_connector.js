async function connectToTalisman() {
  if (window.injectedWeb3 && window.injectedWeb3['talisman']) {
    const provider = window.injectedWeb3['talisman'];
    await provider.enable();
    return provider;
  } else {
    throw "Talisman Wallet not found";
  }
}
