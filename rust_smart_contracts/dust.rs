// from chatGPT, requries versioning but it's a place to start

// cargo install cargo-contract --force --locked

// cargo contract new aleph_zero_token

// build it:
// cargo +nightly contract build


#![cfg_attr(not(feature = "std"), no_std)]

use ink_lang as ink;

#[ink::contract]
mod aleph_zero_token {
    #[ink(storage)]
    pub struct AlephZeroToken {
        total_supply: Balance,
        balances: ink_storage::collections::HashMap<AccountId, Balance>,
    }

    impl AlephZeroToken {
        #[ink(constructor)]
        pub fn new(initial_supply: Balance) -> Self {
            let caller = Self::env().caller();
            let mut balances = ink_storage::collections::HashMap::new();
            balances.insert(caller, initial_supply);
            Self {
                total_supply: initial_supply,
                balances,
            }
        }

        #[ink(message)]
        pub fn total_supply(&self) -> Balance {
            self.total_supply
        }

        #[ink(message)]
        pub fn balance_of(&self, owner: AccountId) -> Balance {
            *self.balances.get(&owner).unwrap_or(&0)
        }

        #[ink(message)]
        pub fn transfer(&mut self, to: AccountId, value: Balance) -> Result<(), String> {
            let caller = Self::env().caller();
            let caller_balance = self.balance_of(caller);
            if caller_balance < value {
                return Err("Insufficient balance".into());
            }
            self.balances.insert(caller, caller_balance - value);
            let recipient_balance = self.balance_of(to);
            self.balances.insert(to, recipient_balance + value);
            Ok(())
        }
    }
}
