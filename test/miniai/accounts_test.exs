defmodule Miniai.AccountsTest do
  use Miniai.DataCase

  alias Miniai.Accounts

  describe "users" do
    alias Miniai.Accounts.User

    import Miniai.AccountsFixtures

    @invalid_attrs %{id: nil, username: nil, first_name: nil, last_name: nil}

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{
        id: "7488a646-e31f-11e4-aace-600308960662",
        username: "johndoe",
        first_name: "John",
        last_name: "Doe"
      }

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.id == "7488a646-e31f-11e4-aace-600308960662"
      assert user.username == "johndoe"
      assert user.first_name == "John"
      assert user.last_name == "Doe"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{id: "7488a646-e31f-11e4-aace-600308960668", last_name: "some updated name"}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.id == "7488a646-e31f-11e4-aace-600308960668"
      assert user.last_name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
