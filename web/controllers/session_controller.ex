defmodule Benchmarker.SessionController do
  use Benchmarker.Web, :controller

  alias Benchmarker.{User}

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> json(%{message: "ok"})
  end

  def create(conn, %{"email" => email} = user_params) do
    user = Repo.get_by(User, email: email)
    user = if user, do: user, else: create_user(user_params)

    if user do
      conn
      |> put_status(:created)
      |> render("show.json", user: user)
    else
      conn
      |> put_status(:bad_request)
      |> json(%{message: "No user!"})
    end
  end

  defp create_user(user_params) do
    changeset = User.changeset(%User{}, user_params)
    case Repo.insert(changeset) do
      {:ok, user} ->
        user
      _ -> nil
    end
  end

end
