defmodule Miniai.Utils do
  def hmac(key, data) do
    :crypto.mac(:hmac, :sha256, key, data)
  end
end
