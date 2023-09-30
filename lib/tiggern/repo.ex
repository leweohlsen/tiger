defmodule Tiggern.Repo do
  use Ecto.Repo,
    otp_app: :tiggern,
    adapter: Ecto.Adapters.SQLite3
end
