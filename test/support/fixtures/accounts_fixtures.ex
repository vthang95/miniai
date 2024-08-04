defmodule Miniai.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Miniai.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        id: "7488a646-e31f-11e4-aace-600308960662",
        first_name: "John",
        last_name: "Doe"
      })
      |> Miniai.Accounts.create_user()

    user
  end
end
