defmodule MiniaiWeb.PublicController do
  use MiniaiWeb, :controller
  alias Miniai.Accounts

  def login_tele_user(conn, params) do
    case Miniai.Accounts.verify_tele_user(params) do
      {:ok, user} ->
        if existed = Accounts.get_user_by_tele_id(user["id"]) do
          {:ok, existed}
        else
          Accounts.create_user(%{
            tele_id: user["id"],
            username: user["username"],
            first_name: user["first_name"],
            last_name: user["last_name"]
          })
        end
        |> case do
          {:ok, u} -> json(conn, u)
          _ -> send_resp(conn, 422, "Something went wrong!")
        end

      :error ->
        send_resp(conn, 401, "Unauthorized!")
    end
  end
end
