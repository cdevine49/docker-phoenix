defmodule TrivialWeb.AccountController do
  use TrivialWeb, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{ "account" => %{ "email" => email, "password" => password } }) do
    Trivial.Accounts.create_user(%{ email: email, password: password })
    |> case do
      {:ok, _user} -> redirect(conn, to: "/")
      {:error, _} -> 
        conn
        |> put_status(:unprocessable_entity)
        |> render("new.html")
    end
  end
end


