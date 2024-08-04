defmodule Miniai.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "users" do
    field :first_name, :string
    field :last_name, :string

    field :tele_id, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:id, :first_name, :last_name, :tele_id])
    |> validate_required([:id, :first_name, :last_name])
  end

  @doc false
  def update_changeset(user, attrs) do
    user
    |> cast(attrs, [:id, :first_name, :last_name])
    |> validate_required([:id])
  end
end
