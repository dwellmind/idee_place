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

alias IdeaStartButton.{
  Repo,
  Accounts,
  Ideas
}

crazy_topic = Repo.insert!(%Ideas.Topic{
  name: "crazy"
})

computing_topic = Repo.insert!(%Ideas.Topic{
  name: "computing"
})

elixir_topic = Repo.insert!(%Ideas.Topic{
  name: "elixir"
})

survival_topic = Repo.insert!(%Ideas.Topic{
  name: "survival"
})

alice = Repo.insert!(%Accounts.User{
  name: "Alice",
  email: "alice@mail.net",
  hashed_password: "$2b$12$jIGp.Jl0N5eGUFiTuqFHkeudSL8LGW1xz0QyiyHkyazYo2JbqIZam", # "password"
  interests: [computing_topic, elixir_topic]
})

_bob = Repo.insert!(%Accounts.User{
  name: "Bob",
  email: "bob@mail.net",
  hashed_password: "$2b$12$jlVJ.lksNp0eGMKYevxy3ewSNOuUBpFM/KE4tK4SOX9OoUe.gp5l2", # "password"
  interests: [computing_topic, crazy_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Create a new world",
  description: "The goal is to create a new world without bad humans.",
  author: alice,
  topics: [crazy_topic, survival_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Thinking about my favorite programming language",
  description: "I should think about… wait a minute. It's Elixir of course!",
  author: alice,
  topics: [computing_topic, elixir_topic]
})
