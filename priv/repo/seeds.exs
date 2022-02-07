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

gardening_topic =
  Repo.insert!(%Ideas.Topic{
    name: "gardening"
  })

computing_topic =
  Repo.insert!(%Ideas.Topic{
    name: "computing"
  })

data_sciences_topic =
  Repo.insert!(%Ideas.Topic{
    name: "data_science"
  })

web_development_topic =
  Repo.insert!(%Ideas.Topic{
    name: "web_development"
  })

devops_topic =
  Repo.insert!(%Ideas.Topic{
    name: "devops"
  })

elixir_topic =
  Repo.insert!(%Ideas.Topic{
    name: "elixir"
  })

ruby_topic =
  Repo.insert!(%Ideas.Topic{
    name: "ruby"
  })

rust_topic =
  Repo.insert!(%Ideas.Topic{
    name: "rust"
  })

javascript_topic =
  Repo.insert!(%Ideas.Topic{
    name: "javascript"
  })

festival_topic =
  Repo.insert!(%Ideas.Topic{
    name: "festival"
  })

music_topic =
  Repo.insert!(%Ideas.Topic{
    name: "music"
  })

djing_topic =
  Repo.insert!(%Ideas.Topic{
    name: "djing"
  })

rock_topic =
  Repo.insert!(%Ideas.Topic{
    name: "rock"
  })

hiphop_topic =
  Repo.insert!(%Ideas.Topic{
    name: "hiphop"
  })

techno_topic =
  Repo.insert!(%Ideas.Topic{
    name: "techno"
  })

boardgames_topic =
  Repo.insert!(%Ideas.Topic{
    name: "boardgames"
  })

chess_topic =
  Repo.insert!(%Ideas.Topic{
    name: "chess"
  })

tarot_topic =
  Repo.insert!(%Ideas.Topic{
    name: "tarot"
  })

alice =
  Repo.insert!(%Accounts.User{
    name: "Alice",
    email: "alice@mail.net",
    # "password"
    hashed_password: "$2b$12$jIGp.Jl0N5eGUFiTuqFHkeudSL8LGW1xz0QyiyHkyazYo2JbqIZam",
    starred_topics: [computing_topic, ruby_topic, javascript_topic, boardgames_topic, chess_topic, music_topic, rock_topic]
  })

bob =
  Repo.insert!(%Accounts.User{
    name: "Bob",
    email: "bob@mail.net",
    # "password"
    hashed_password: "$2b$12$jlVJ.lksNp0eGMKYevxy3ewSNOuUBpFM/KE4tK4SOX9OoUe.gp5l2",
    starred_topics: [computing_topic, elixir_topic, rust_topic, data_sciences_topic, devops_topic, tarot_topic, music_topic]
  })

carl =
  Repo.insert!(%Accounts.User{
    name: "Carl",
    email: "carl@mail.net",
    # "password"
    hashed_password: "$2b$12$jIGp.Jl0N5eGUFiTuqFHkeudSL8LGW1xz0QyiyHkyazYo2JbqIZam",
    starred_topics: [gardening_topic, chess_topic, music_topic, hiphop_topic, techno_topic, djing_topic]
  })

Repo.insert!(%Ideas.Idea{
  title: "The Rennes Boardgames festival",
  description: File.read!(Path.expand("priv/repo/idea_descriptions/idea_description_01.md")),
  author: alice,
  topics: [boardgames_topic, festival_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Index all the nowadays devops good practices",
  description: File.read!(Path.expand("priv/repo/idea_descriptions/idea_description_01.md")),
  author: bob,
  topics: [computing_topic, devops_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "The Nantes monthly DJ meetup",
  description: File.read!(Path.expand("priv/repo/idea_descriptions/idea_description_01.md")),
  author: carl,
  topics: [music_topic, djing_topic]
})

idea1 =
  Repo.insert!(%Ideas.Idea{
    title: "Id velit ut tortor pretium viverra suspendisse",
    description: File.read!(Path.expand("priv/repo/idea_descriptions/idea_description_01.md")),
    author: alice,
    topics: [computing_topic, elixir_topic]
  })

idea2 =
  Repo.insert!(%Ideas.Idea{
    title: "Tellus elementum sagittis",
    description: File.read!(Path.expand("priv/repo/idea_descriptions/idea_description_01.md")),
    author: bob,
    topics: [computing_topic, elixir_topic]
  })

idea3 =
  Repo.insert!(%Ideas.Idea{
    title: "Nec nam aliquam sem et tortor consequat id porta",
    description: File.read!(Path.expand("priv/repo/idea_descriptions/idea_description_01.md")),
    author: bob,
    topics: [computing_topic, elixir_topic]
  })

Repo.insert!(%Ideas.Idea{
  title: "Molestie at elementum",
  description: File.read!(Path.expand("priv/repo/idea_descriptions/idea_description_01.md")),
  author: bob,
  topics: [computing_topic, elixir_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Elementum eu facilisis sed odio morbi",
  description: File.read!(Path.expand("priv/repo/idea_descriptions/idea_description_01.md")),
  author: bob,
  topics: [computing_topic, elixir_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Feugiat nibh sed pulvinar proin gravida",
  description: File.read!(Path.expand("priv/repo/idea_descriptions/idea_description_01.md")),
  author: alice,
  topics: [computing_topic, ruby_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Et leo duis ut diam",
  description: File.read!(Path.expand("priv/repo/idea_descriptions/idea_description_01.md")),
  author: bob,
  topics: [boardgames_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "In metus vulputate eu scelerisque",
  description: File.read!(Path.expand("priv/repo/idea_descriptions/idea_description_01.md")),
  author: carl,
  topics: [boardgames_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Sapien pellentesque habitant morbi",
  description: File.read!(Path.expand("priv/repo/idea_descriptions/idea_description_01.md")),
  author: bob,
  topics: [computing_topic, elixir_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Imperdiet massa tincidunt nun",
  description: File.read!(Path.expand("priv/repo/idea_descriptions/idea_description_01.md")),
  author: carl,
  topics: [chess_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Tellus integer",
  description: File.read!(Path.expand("priv/repo/idea_descriptions/idea_description_01.md")),
  author: carl,
  topics: [tarot_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Et netus et malesuada fames ac",
  description: File.read!(Path.expand("priv/repo/idea_descriptions/idea_description_01.md")),
  author: carl,
  topics: [gardening_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Etiam sit amet nisl",
  description: File.read!(Path.expand("priv/repo/idea_descriptions/idea_description_01.md")),
  author: bob,
  topics: [computing_topic, web_development_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Nibh sed pulvinar proin",
  description: File.read!(Path.expand("priv/repo/idea_descriptions/idea_description_01.md")),
  author: bob,
  topics: [computing_topic, ruby_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Velit scelerisque in dictum non consectetur",
  description: File.read!(Path.expand("priv/repo/idea_descriptions/idea_description_01.md")),
  author: bob,
  topics: [music_topic, techno_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Felis eget nunc lobortis",
  description: File.read!(Path.expand("priv/repo/idea_descriptions/idea_description_01.md")),
  author: bob,
  topics: [computing_topic, ruby_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Odio euismod lacinia at quis risus sed vulputate",
  description: File.read!(Path.expand("priv/repo/idea_descriptions/idea_description_01.md")),
  author: bob,
  topics: [computing_topic, elixir_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Ulputate enim nulla",
  description: File.read!(Path.expand("priv/repo/idea_descriptions/idea_description_01.md")),
  author: bob,
  topics: [computing_topic, ruby_topic, elixir_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Cursus mattis molestie a iaculis at",
  description: File.read!(Path.expand("priv/repo/idea_descriptions/idea_description_01.md")),
  author: bob,
  topics: [computing_topic, devops_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Posuere morbi leo",
  description: File.read!(Path.expand("priv/repo/idea_descriptions/idea_description_01.md")),
  author: bob,
  topics: [music_topic, hiphop_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Feugiat vivamus",
  description: File.read!(Path.expand("priv/repo/idea_descriptions/idea_description_01.md")),
  author: carl,
  topics: [music_topic, djing_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Commodo quis",
  description: File.read!(Path.expand("priv/repo/idea_descriptions/idea_description_01.md")),
  author: bob,
  topics: [music_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Habitasse platea",
  description: File.read!(Path.expand("priv/repo/idea_descriptions/idea_description_01.md")),
  author: alice,
  topics: [computing_topic, javascript_topic, web_development_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Nisl nunc mi ipsum",
  description: File.read!(Path.expand("priv/repo/idea_descriptions/idea_description_01.md")),
  author: carl,
  topics: [gardening_topic]
})

Repo.insert!(%Ideas.Idea{
  title: "Odio euismod lacinia",
  description: File.read!(Path.expand("priv/repo/idea_descriptions/idea_description_01.md")),
  author: bob,
  topics: [computing_topic, data_sciences_topic]
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
