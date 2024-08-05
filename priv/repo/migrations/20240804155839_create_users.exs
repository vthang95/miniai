defmodule Miniai.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def up do
    create table("users", primary_key: false) do
      add :id, :uuid, primary_key: true
      add :first_name, :string
      add :last_name, :string
      add :username, :string

      add :tele_id, :bigint

      timestamps(type: :utc_datetime)
    end

    create index("users", [:tele_id], unique: true, where: "tele_id is not null")
  end

  def down() do
    drop table("users")
  end
end
