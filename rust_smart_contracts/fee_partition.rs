// from chatGPT, requires versioning
// automatically partition a fee (which % the user can specify)
// the fee will be put into a single wallet pool
// users in the app will vote to decide which charity or worthy cause it is donated to
// at the end of each month, 50% of the dust_vault will be converted to USD and donated

#![cfg_attr(not(feature = "std"), no_std)]

use ink::prelude::vec::Vec;
use ink::storage::Mapping;

#[ink::contract]
mod transaction_splitter {
    #[ink(storage)]
    pub struct TransactionSplitter {
        owner: AccountId,  // Owner of the contract
        fee_recipient: AccountId,  // Wallet to receive the 1% fee
        fee_percentage: u128,  // 1% fee in basis points (i.e. 100 basis points = 1%)
    }

    impl TransactionSplitter {
        /// Initializes the contract with the fee recipient and fee percentage.
        #[ink(constructor)]
        pub fn new(fee_recipient: AccountId) -> Self {
            Self {
                owner: Self::env().caller(),
                fee_recipient,
                fee_percentage: 100,  // 1% as 100 basis points
            }
        }

        /// Transfer function that sends 1% to the fee recipient.
        #[ink(message)]
        pub fn transfer_with_fee(&mut self, to: AccountId, value: Balance) -> Result<(), ink::env::Error> {
            let caller = self.env().caller();

            // Calculate 1% of the transaction value
            let fee = value * self.fee_percentage / 10_000;
            let remaining = value - fee;

            // Transfer the remaining amount to the recipient
            self.env().transfer(to, remaining)?;

            // Send 1% to the fee recipient
            self.env().transfer(self.fee_recipient, fee)?;

            Ok(())
        }

        /// Allows the owner to update the fee recipient if necessary.
        #[ink(message)]
        pub fn update_fee_recipient(&mut self, new_recipient: AccountId) {
            assert_eq!(self.owner, self.env().caller());
            self.fee_recipient = new_recipient;
        }
    }

    #[cfg(test)]
    mod tests {
        use super::*;

        #[ink::test]
        fn it_works() {
            let accounts = ink::env::test::default_accounts::<ink::env::DefaultEnvironment>().unwrap();
            let mut contract = TransactionSplitter::new(accounts.bob);
            let result = contract.transfer_with_fee(accounts.alice, 1_000);
            assert!(result.is_ok());
        }

        #[ink::test]
        #[should_panic]
        fn test_invalid_transfer() {
            let accounts = ink::env::test::default_accounts::<ink::env::DefaultEnvironment>().unwrap();
            let mut contract = TransactionSplitter::new(accounts.bob);
            let _ = contract.transfer_with_fee(accounts.alice, 0).unwrap();
        }
    }
}
