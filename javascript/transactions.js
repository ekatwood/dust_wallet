// from chatGPT, requires versioning
async function sendTransaction(account) {
  const transfer = api.tx.balances.transfer('recipient_address', 1000000000000); // Amount is in smallest unit

  const { signer } = await web3FromAddress(account.address);

  const unsub = await transfer.signAndSend(account.address, { signer }, ({ status }) => {
    if (status.isInBlock) {
      console.log(`Transaction included in block ${status.asInBlock}`);
    } else if (status.isFinalized) {
      console.log(`Transaction finalized in block ${status.asFinalized}`);
      unsub();
    }
  });
}
