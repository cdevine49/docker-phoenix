defmodule Trivial.Accounts do
  import Ecto.Query
  alias Trivial.Accounts.User


  @doc """
  Creates a new user

  iex> { :ok, user } = Trivial.Accounts.create_user(%{ email: "a@a.io", password: "dingo blank square purple" })
  iex> %Trivial.Accounts.User{email: "a@a.io", verified: false} = user

  iex> { :error, changeset } = Trivial.Accounts.create_user(%{ email: "", password: "" })
  iex> %Ecto.Changeset{errors: [_|_]} = changeset
  """
  def create_user(attrs) do
    %User{}
    |> User.changeset(attrs)
    |> Trivial.Repo.insert()
  end
end
