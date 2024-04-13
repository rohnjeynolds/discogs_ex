defmodule DiscogsEx.Database do
  import DiscogsEx
  alias DiscogsEx.Client

  @moduledoc """
  Database API for Discogs. Info about releases, artists, and labels.
  """

  @doc """
  Search the database.

  ## Example
      DiscogsEx.Database.search "Demi Lovato", %{"title": "sorry not sorry"}, client

  ## Parameters:
      - q (String.t)
      - params (%{})
        - type
        - title
        - release_title
        - credit
        - artist
        - anv
        - label
        - genre
        - style
        - country
        - year
        - format
        - catno
        - barcode
        - track
        - submitter
        - contributor
  """
  @spec search(map()) :: DiscogsEx.response
  def search(q, params \\ %{}, client \\ %Client{}) do
    get "database/search", client, q |> merge_query_and_params(params)
  end

  @spec get_artist_releases(any(), any()) :: none()
  def get_artist_releases(artist_id, params \\ %{}, client \\ %Client{}) do
    # get "/artists/#{artist_id}/releases", client, params, [timeout: 1000*60*5, recv_timeout: 1000*60*5]
    get "/artists/#{artist_id}/releases", client, params
  end

  defp merge_query_and_params(q, params) do
    Map.merge(%{q: q}, params)
  end
end
