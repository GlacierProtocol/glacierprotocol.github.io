---
title: Transaction execution and verification
description: Learn how to withdrawal Bitcoin using Glacier, the step-by-step
  protocol for storing bitcoins in a highly secure way
---

On any Internet-connected computer:

1. Access the <span class="warning">raw signed transaction</span> you sent
yourself from your smartphone previously.
2. Verify the transaction data.
    1. Go to https://coinb.in/#verify.
    2. Copy-paste the <span class="warning">raw signed transaction</span> into
    the webpage and click Submit.
    3. Under "Outputs":
        1. Verify the destination address is correct.
        2. Verify the amount going to the destination address is correct.
        3. If you did not withdraw all funds from these unspent transactions,
        you'll also see a second output which "sends" the remainder of the
        funds "back" to your
        <span class="warning">cold storage address</span>. This is necessary;
        it's how Bitcoin is designed to operate.
3. Execute the transaction.
    1. Go to https://coinb.in/#broadcast (or any comparable public service
    which can broadcast a <span class="warning">raw signed transaction</span>
    to the Bitcoin network).
    2. Copy-paste the raw signed transaction into the webpage and click Submit.
    3. You should see a green bar appear with a
    <span class="warning">transaction ID</span> in it. This is the
    <span class="warning">transaction ID</span> for your withdrawal; make a
    note of it.
4. Verify the withdrawal on the public blockchain.
    1. Go to [Blockr](https://www.coinbase.com/) , paste
    the destination <span class="warning">address</span> into the search bar,
    and press Enter. You'll be taken to a page that says "Bitcoin Address" at
    the top, with the destination address listed underneath.
    2. Within a couple of minutes (and often much faster), you should be able to
    refresh this page and see your funds listed under "Unconfirmed".
    3. Periodically refresh the page until you see the funds moved from
    "Unconfirmed" to be reflected in "Balance". This generally happens within
    15 minutes; if the Bitcoin network is unusually congested, it may take
    longer.
