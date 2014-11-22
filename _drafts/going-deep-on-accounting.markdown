---
title: Going Deep on Accounting
subtitle: Learning the problem domain through code
category: Programming
---

I like to think of it as my personal <abbr title="Unique Selling Point" class="initialism">USP</abbr>:
when I get involved in a new project, I like to go deep. I love learning about
the business domain, about the problems I'm trying to solve. Over the years,
I've learned a fair bit about the details of several businesses, from energy
monitoring and telecoms, through to wine sales and auctioneering. While I was
working with [FreeAgent](http://freeagent.com/), I wound up getting so into the
details of the problem domain that I earned an
[AAT Diploma in Accounting](https://www.aat.org.uk/qualifications/level-3-aat-accounting-qualification).

I was digging through some old home directories recently, trying to consolidate
a pile of ancient backups to make sure I hadn't lost anything. While I was
sifting through, I came across a handful of related projects I built to help
myself understand a few aspects of accounting. That's the other thing I've
discovered over the years: sometimes the best way to understand a concept -- to
make sure I've really internalised it -- is to write code to express the idea.
It doesn't have to be anything fancy, just a wee spike to demonstrate the
functionality. That's why I wind up with dozens of small projects sitting in
`~/Development/Personal` in various stages of completion, often without tests,
or a working UI, or the sort of quality of code that you'd push into
production. (It's also why I love Twitter Bootstrap and other UI frameworks --
even I can chuck together something that looks pretty enough to work with.)

Anyway, while digging around, I found three projects I wrote about three and a
half years ago, while I was studying for the accounting qualification. They
each show off an aspect of the accounting problem domain that I was trying to
learn. I seem to have been practising README-driven development in some of
them, in that the code doesn't reflect as much functionality as the
documentation. In other cases, the documentation is non-existent, so I'm pretty
much guessing what it's all about. But I figured I might as well chuck them up
on GitHub, just in case they provide inspiration or a starting point for any of
you.

## T-Accounts

> Code on GitHub: <https://github.com/mathie/t_accounts>

T-Tables are a mechanism for generating a trial balance from a list of
transactions. Essentially, they allow you to convert the source transactions
(invoices, credit notes, payments, etc) into a summary of totals for particular
categories (e.g. totals for sales, cost of sales, and various administrative
expenses). These category totals are then used to create the standard set of
accounting reports (a Profit & Loss report, and a Balance Sheet).

T-Tables are designed to be done manually, with a pen and paper. They pre-date
the help of Excel spreadsheets! But that doesn't mean we can't get a bit of
help from a computer to generate them. This app is composed of 'work sheets',
since I was spending time doing lots of worked examples to practice generating
a trial balance. Typically, a worked example will have a bit of a back story to
make it more interesting (it's all relative). Then you'll have a set of
transactions, and a set of categories. Each transaction is transfer between two
categories. For example, raising an invoice to one of your clients for £500 is a credit of £500 to the Sales category, and a corresponding debit of £500 to Trade Debtors.

Once we've entered all the transactions in to the worksheet, we draw up the
t-tables for each category, showing all the credits and debits on that
category. Summing them up gives us a total for the account, which goes onto the
trial balance. Since all of our transactions have balanced credits and debits,
the final trial balance should have the same value of credits and debits, too.
That's a useful check to make sure we've added everything up correctly.

## Cost Accounting

> Code on GitHub: <https://github.com/mathie/cost_accounting>

### Modelling costs of sale

I was starting to play around with a couple of ideas here. The first was to model the profitability of products you're selling. When you're manufacturing a physical product, there are two things you need to take into account:

* **Fixed overheads**. These are things like your office rent, purchasing
  machinery to manufacture the product, or full time employees. In other words,
  they're the costs that are the same, no matter how many of your product you
  create.

* **Variable costs**. These are the costs which are directly proportional to
  the number of products you manufacture. Things like materials, sometimes
  energy usage, often hourly employees who are directly involved in the
  production process.

You also get costs which are a combination of both of these, known as
**semi-variable costs**. Think of an electricity bill, where you have a
standing charge, plus a cost per KWh for the actual energy used. And, finally,
you have **stepped costs**, which behave kind of like fixed costs, except they
increase at particular product volumes. Say, for example, your factory has the
capacity to build 10,000 products per week. If you're looking to build 15,000
products per week, you'll need a second factory!

The idea with this part of the app was to model the sale price of each product,
and the costs of sale, so that we could figure out the profitability of a
product at various production levels. It looks like I got as far as capturing
all the necessary information, but never got around to drawing the pretty
graphs to demonstrate profitability. Pull requests gratefully accepted! :)

### When to restock the beer fridge

The other aspect of this app was about stock control. It turns out there's a
standard formula in accounting for figuring out when you should order more
stock. It takes into account

* the normal rate of stock usage;

* the lead time for ordering more stock from the supplier;

* the cost of ordering (e.g. postage)

* the cost of storing stock (e.g. refrigeration costs); and

* a minimum stock level (buffer).

From this, we can calculate:

* the stock level at which we should plan to reorder, so that new stock arrives before the old stock is depleted;

* the number of units of stock that we should order; and

* the anticipated maximum and minimum stock level (i.e. the amount of storage space we're going to need in the warehouse).

Quite clever, eh? In practice, the only time I've ever used it in anger is to
model the stock levels and reorder dates for the contents of the FreeAgent beer
fridge. After all, it wouldn't do to have insufficient stock at 4pm on a Friday
afternoon!

## Accounts

> Code on GitHub: <https://github.com/mathie/accounts>

I've a dim recollection I had grand plans for this code. I was keen to explore
different ways of representing accrual-based transactions (invoices, credit
notes and bills), along with cash transactions (both those associated with
invoice/bill payments, and 'pure' cash transactions). Unfortunately, I only
ever got as far as modelling the accrual transactions. Still, it did make me
realise that invoices, credit notes, and credit notes are really all just the
same thing. (Yeah, I know, it doesn't take a Diploma in Accounting to figure
that out!) I never did come up with a satisfying way of modelling the cash book
side of things...

On the plus side, this code has been useful for modelling invoices in a number
of subsequent projects, which has been a time saver for a few clients! Of
course, if you're looking for a full-featured accounting system, your best bet
would be to check out [FreeAgent](http://freeagent.com/)!
