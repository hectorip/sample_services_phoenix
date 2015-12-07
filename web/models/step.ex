defmodule SampleServices.Step do
  use SampleServices.Web, :model

  schema "steps" do
    field :beat, :string
    field :url, :string
    field :name, :string

    timestamps
  end

  @required_fields ~w(beat url name)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
