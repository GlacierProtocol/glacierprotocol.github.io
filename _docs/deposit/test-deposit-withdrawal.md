---
title: Test deposit and withdrawal
description: Learn how to test withdrawing Bitcoin from Glacier, the
  step-by-step protocol for storing bitcoins in a highly secure way
---

It's important to make sure everything is working properly before proceeding.
You'll verify this by making a token deposit to, and withdrawal from, your cold
storage address.

Depositing funds requires the Internet, and does not require
handling any critically sensitive cold storage data, so you can use any
Internet-connected computer for this section.

1. Open your electronic copy of the
<span class="warning">Cold Storage Information Page</span> (see Section II for
details).
2. Perform a test deposit.
    1. Use the wallet software or service of your choice to send the approximate
    equivalent to fund 1000 bytes of transactions to your
    <span class="warning">cold storage address</span>.
    As of January 17, 2018, with a fee rate of 510 sat/B and $11185 USD/BTC this
    is a deposit of approximately $57. Fees have since declined, but the user is
    advised to check the current fee rate before making the test deposit.
    The Bitcoin network requires a very small, flat fee to process transactions. We
    recommend you use a wallet service that recommends (or pays) a fee for you
    automatically, which most do.
        1. Copy-paste your <span class="warning">cold storage address</span>
        from the <span class="warning">Cold Storage Information Page</span>
        into the wallet software.
    2. Wait for the Bitcoin network to confirm the transaction at least once.
    The way you tell whether a transaction has been confirmed varies depending
    on the software or service you are using to send funds, but it should be
    displayed prominently.
3. Perform a test withdrawal.
    1. Execute the [Withdrawal Protocol](/docs/withdrawal/execution/) to withdraw
    the remaining balance ($6 USD - deposit fees) from cold storage to a regular
    Bitcoin address of your choice.
    2. Wait for the Bitcoin network to confirm the transaction at least once.
    (Instructions for doing this are in the Withdrawal protocol.)
