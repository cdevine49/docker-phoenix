defmodule Trivial.RegistrationTest do
  use ExUnit.Case, async: true
  use Wallaby.Feature

  feature "user signs up with invalid attributes", %{session: session} do
    session
    |> visit("/")
  end
end
