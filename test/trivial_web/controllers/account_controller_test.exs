defmodule TrivialWeb.AccountControllerTest do
  use TrivialWeb.ConnCase
  doctest Trivial.Accounts

  import Ecto.Query, only: [from: 2]
  alias Trivial.Repo
  alias Trivial.Accounts.User

  @valid_params %{ email: "a@a.io", password: "G00d_pass! dogs-21 cats-13" }

  describe "new" do
    test "navigating to account registration page", %{conn: conn} do
      conn = get(conn, "/accounts/new")
      assert html_response(conn, 200) =~ "Create Your Account"
    end
  end

  describe "create" do
    test "registering account with valid params", %{conn: conn} do
      conn = post(conn, "/accounts", account: @valid_params)
      assert Repo.get_by(User, email: @valid_params.email, verified: false)
      assert redirected_to(conn) == "/"
    end

    test "registering with empty email", %{conn: conn} do
      conn = post(conn, "/accounts", account: %{@valid_params | email: ""})
      assert Repo.one(from u in User, select: count())
      assert html_response(conn, 422) =~ "Create Your Account"
    end

    test "registering with empty password", %{conn: conn} do
      conn = post(conn, "/accounts", account: %{@valid_params | password: ""})
      assert Repo.one(from u in User, select: count())
      assert html_response(conn, 422) =~ "Create Your Account"
    end

    test "registering with illegal email", %{conn: conn} do
      account = %{@valid_params | email: "no-at"}
      conn = post(conn, "/accounts", account: account)
      assert Repo.one(from u in User, select: count())
      assert html_response(conn, 422) =~ "Create Your Account"
    end

    test "registering with short password", %{conn: conn} do
      account = %{@valid_params | password: "short"}
      conn = post(conn, "/accounts", account: account)
      assert Repo.one(from u in User, select: count())
      assert html_response(conn, 422) =~ "Create Your Account"
    end
  end
end

