defmodule IdeePlace.Ideas.SearchParser do
  @authors_regex ~r/@[a-zA-Z]*/
  @topics_regex ~r/#[a-zA-Z]*/
  @user_stars_regex ~r/![a-zA-Z]*/

  @doc """
  Parse a search string and return a Map with keywords and authors.

  ## Examples

      iex> IdeePlace.Ideas.SearchParser.parse("@alice elixir programming")
      %{keywords: ["elixir", "programming"], authors: ["alice"]}

      iex> IdeePlace.Ideas.SearchParser.parse("ruby @alice  @bob")
      %{keywords: ["ruby"], authors: ["alice", "bob"]}

  """
  def parse(search) do
    words = String.split(search, " ")

    {authors, words} = find_authors(words)
    {topics, words} = find_topics(words)
    {user_stars, words} = find_user_stars(words)
    {keywords, _} = find_keywords(words)

    %{
      authors: authors,
      topics: topics,
      user_stars: user_stars,
      keywords: keywords
    }
  end

  defp find_authors(words) do
    {patterns, rest} = catch_pattern(words, @authors_regex)
    {Enum.map(patterns, &String.trim(&1, "@")), rest}
  end

  defp find_topics(words) do
    {patterns, rest} = catch_pattern(words, @topics_regex)
    {Enum.map(patterns, &String.trim(&1, "#")), rest}
  end

  defp find_user_stars(words) do
    {patterns, rest} = catch_pattern(words, @user_stars_regex)
    {Enum.map(patterns, &String.trim(&1, "!")), rest}
  end

  defp find_keywords(words) do
    {words, []}
  end

  defp catch_pattern(words, regex) do
    words
    |> Enum.group_by(fn word -> Regex.match?(regex, word) end)
    |> then(&({&1[true] || [], &1[false] || []}))
  end
end
