defmodule IdeePlace.Ideas.SearchParser do
  @authors_regex ~r/@[a-zA-Z]*/

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
    {keywords, _} = find_keywords(words)

    %{
      authors: authors,
      keywords: keywords
    } |> IO.inspect(label: "PARSING:")
  end

  defp find_authors(words) do
    {patterns, rest} = catch_pattern(words, @authors_regex)
    {Enum.map(patterns, &String.trim(&1, "@")), rest}
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
