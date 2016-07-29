defmodule Benchmarker.User do
  use Benchmarker.Web, :model

  schema "users" do
    field :email, :string
    field :nickname, :string
    field :avatar, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :nickname, :avatar])
    |> validate_required([:email])
  end
end
