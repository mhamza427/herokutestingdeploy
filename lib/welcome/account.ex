defmodule Welcome.Account do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :age, :integer
    field :name, :string
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:name, :password, :age])
    |> validate_required([:name, :password, :age])
  end
end
