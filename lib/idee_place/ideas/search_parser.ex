defmodule IdeePlace.Ideas.SearchParser do
  @authors_regex ~r/@[a-zA-Z]*/

  alias Enum

  @doc """
  Parse a search string and return a Map with keywords and authors.

  ## Examples

      iex> IdeePlace.Ideas.SearchParser.parse("@alice elixir programming")
      %{keywords: ["elixir", "programming"], authors: ["alice"]}

      iex> IdeePlace.Ideas.SearchParser.parse("ruby @alice  @bob")
      %{keywords: ["ruby"], authors: ["alice", "bob"]}

  """
  def parse(search) do
    keywords = find_keywords(search)
    authors = find_authors(search)
    %{keywords: keywords, authors: authors}
  end

  defp find_authors(search) do
    Regex.scan(@authors_regex, search)
    |> Enum.flat_map(fn author -> author end)
    |> Enum.map(fn author -> String.trim(author, "@") end)
  end

  defp find_keywords(search) do
    Regex.split(@authors_regex, search)
    |> Enum.flat_map(fn string -> String.split(string, " ") end)
    |> Enum.filter(fn string -> string != "" end)
  end
end
