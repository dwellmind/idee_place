# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     IdeaStartButton.Repo.insert!(%IdeaStartButton.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias IdeaStartButton.Repo
alias IdeaStartButton.Accounts

Repo.insert!(%Accounts.User{
  email: "alice@mail.net",
  hashed_password: "$2b$12$jIGp.Jl0N5eGUFiTuqFHkeudSL8LGW1xz0QyiyHkyazYo2JbqIZam" # "password"
})

Repo.insert!(%Accounts.User{
  email: "bob@mail.net",
  hashed_password: "$2b$12$jlVJ.lksNp0eGMKYevxy3ewSNOuUBpFM/KE4tK4SOX9OoUe.gp5l2" # "password"
})
