defmodule SampleServices.StepTest do
  use SampleServices.ModelCase

  alias SampleServices.Step

  @valid_attrs %{beat: "some content", name: "some content", url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Step.changeset(%Step{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Step.changeset(%Step{}, @invalid_attrs)
    refute changeset.valid?
  end
end
