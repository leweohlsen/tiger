# Tiggern

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Example: Weighted Expense Splitting

Let's have 4 participants: Alice, Bob, Charlie, and David.

Alice is in tier 5
Bob is in tier 3
Charlie is in tier 1
David is in tier 0

Let's assume the following percentage contributions for each tier:

Tier 5 contributes 25%
Tier 4 contributes 20%
Tier 3 contributes 15%
Tier 2 contributes 10%
Tier 1 contributes 5%
Tier 0 contributes 0%

Now, let's say they have a bill of $100 to split.

First, we calculate the total contribution percentage from all participants which is 25% (Alice) + 15% (Bob) + 5% (Charlie) + 0% (David) = 45%.

Next, we calculate each person's share:

Alice's Share: (25 / 45) * 100 = $55.56
Bob's Share: (15 / 45) * 100 = $33.33
Charlie's Share: (5 / 45) * 100 = $11.11
David's Share: (0 / 45) * 100 = $0.00

This way, the expense gets divided according to the tiers of each participant. Please note that these are just suggested percentages for each tier. You can adjust them according to your requirements.

## Prompts Used
 * I would like to build an application where expenses are split between persons. Expenses are split not equally but based on a tier that each person has. While tier 0 pays nothing, tier 5 pays a larger fraction than other tiers. If all participants had tier 3, which is the middle paying tier, they would pay the same. How can I divide an expense in this way?
