// from chatGPT, requires versioning
const connectButton = document.getElementById('connect-wallet');

connectButton.addEventListener('click', async () => {
  await connectAlephZeroWallet();
});
