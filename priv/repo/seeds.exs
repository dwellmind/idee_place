# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     IdeePlace.Repo.insert!(%IdeePlace.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias IdeePlace.{
  Repo,
  Accounts,
  Ideas
}

crazy_topic =
  Repo.insert!(%Ideas.Topic{
    name: "crazy"
  })

computing_topic =
  Repo.insert!(%Ideas.Topic{
    name: "computing"
  })

elixir_topic =
  Repo.insert!(%Ideas.Topic{
    name: "elixir"
  })

ruby_topic =
  Repo.insert!(%Ideas.Topic{
    name: "ruby"
  })

survival_topic =
  Repo.insert!(%Ideas.Topic{
    name: "survival"
  })

alice =
  Repo.insert!(%Accounts.User{
    name: "Alice",
    email: "alice@mail.net",
    # "password"
    hashed_password: "$2b$12$jIGp.Jl0N5eGUFiTuqFHkeudSL8LGW1xz0QyiyHkyazYo2JbqIZam",
    starred_topics: [computing_topic, elixir_topic]
  })

bob =
  Repo.insert!(%Accounts.User{
    name: "Bob",
    email: "bob@mail.net",
    # "password"
    hashed_password: "$2b$12$jlVJ.lksNp0eGMKYevxy3ewSNOuUBpFM/KE4tK4SOX9OoUe.gp5l2",
    starred_topics: [computing_topic, crazy_topic]
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

idea1 =
  Repo.insert!(%Ideas.Idea{
    title: "Idea title 1",
    description: "Idea description 1",
    author: bob,
    topics: [computing_topic, elixir_topic]
  })

idea2 =
  Repo.insert!(%Ideas.Idea{
    title: "Idea title 2",
    description: "Idea description 2",
    author: bob,
    topics: [computing_topic, elixir_topic]
  })

idea3 =
  Repo.insert!(%Ideas.Idea{
    title: "Idea title 3",
    description: "Idea description 3",
    author: bob,
    topics: [computing_topic, elixir_topic]
  })

Repo.insert!(%Ideas.Idea{
  title: "Idea title 4",
  description: "Idea description 4",
  author: bob,
  topics: [computing_topic, elixir_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Idea title 5",
  description: "Idea description 5",
  author: bob,
  topics: [computing_topic, elixir_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Idea title 6",
  description: "Idea description 6",
  author: bob,
  topics: [computing_topic, ruby_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Idea title 7",
  description: "Idea description 7",
  author: bob,
  topics: [computing_topic, ruby_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Idea title 8",
  description: "Idea description 8",
  author: bob,
  topics: [computing_topic, ruby_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Idea title 9",
  description: "Idea description 9",
  author: bob,
  topics: [computing_topic, ruby_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Idea title 10",
  description: "Idea description 10",
  author: bob,
  topics: [computing_topic, ruby_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Idea title 11",
  description: "Idea description 11",
  author: bob,
  topics: [computing_topic, ruby_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Idea title 12",
  description: "Idea description 12",
  author: bob,
  topics: [computing_topic, ruby_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Idea title 13",
  description: "Idea description 13",
  author: bob,
  topics: [computing_topic, ruby_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Idea title 14",
  description: "Idea description 14",
  author: bob,
  topics: [computing_topic, ruby_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Idea title 15",
  description: "Idea description 15",
  author: bob,
  topics: [computing_topic, ruby_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Idea title 16",
  description: "Idea description 16",
  author: bob,
  topics: [computing_topic, ruby_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Idea title 17",
  description: "Idea description 17",
  author: bob,
  topics: [computing_topic, ruby_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Idea title 18",
  description: "Idea description 18",
  author: bob,
  topics: [computing_topic, ruby_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Idea title 19",
  description: "Idea description 19",
  author: bob,
  topics: [computing_topic, ruby_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Idea title 20",
  description: "Idea description 20",
  author: bob,
  topics: [computing_topic, ruby_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Idea title 21",
  description: "Idea description 21",
  author: bob,
  topics: [computing_topic, ruby_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Idea title 22",
  description: "Idea description 22",
  author: bob,
  topics: [computing_topic, ruby_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Idea title 23",
  description: "Idea description 23",
  author: bob,
  topics: [computing_topic, ruby_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Idea title 24",
  description: "Idea description 24",
  author: bob,
  topics: [computing_topic, ruby_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Idea title 25",
  description: "Idea description 25",
  author: bob,
  topics: [computing_topic, ruby_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Idea title 26",
  description: "Idea description 26",
  author: bob,
  topics: [computing_topic, ruby_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Idea title 27",
  description: "Idea description 27",
  author: bob,
  topics: [computing_topic, ruby_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Idea title 28",
  description: "Idea description 28",
  author: bob,
  topics: [computing_topic, ruby_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Idea title 29",
  description: "Idea description 29",
  author: bob,
  topics: [computing_topic, ruby_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Idea title 30",
  description: "Idea description 30",
  author: bob,
  topics: [computing_topic, ruby_topic]
})

Repo.insert!(%Ideas.UserStarredIdea{
  user: alice,
  idea: idea1
})

Repo.insert!(%Ideas.UserStarredIdea{
  user: alice,
  idea: idea2
})

Repo.insert!(%Ideas.UserStarredIdea{
  user: bob,
  idea: idea3
})
