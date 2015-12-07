defmodule SampleServices.StepControllerTest do
  use SampleServices.ConnCase

  alias SampleServices.Step
  @valid_attrs %{beat: "some content", name: "some content", url: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, step_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing steps"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, step_path(conn, :new)
    assert html_response(conn, 200) =~ "New step"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, step_path(conn, :create), step: @valid_attrs
    assert redirected_to(conn) == step_path(conn, :index)
    assert Repo.get_by(Step, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, step_path(conn, :create), step: @invalid_attrs
    assert html_response(conn, 200) =~ "New step"
  end

  test "shows chosen resource", %{conn: conn} do
    step = Repo.insert! %Step{}
    conn = get conn, step_path(conn, :show, step)
    assert html_response(conn, 200) =~ "Show step"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, step_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    step = Repo.insert! %Step{}
    conn = get conn, step_path(conn, :edit, step)
    assert html_response(conn, 200) =~ "Edit step"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    step = Repo.insert! %Step{}
    conn = put conn, step_path(conn, :update, step), step: @valid_attrs
    assert redirected_to(conn) == step_path(conn, :show, step)
    assert Repo.get_by(Step, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    step = Repo.insert! %Step{}
    conn = put conn, step_path(conn, :update, step), step: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit step"
  end

  test "deletes chosen resource", %{conn: conn} do
    step = Repo.insert! %Step{}
    conn = delete conn, step_path(conn, :delete, step)
    assert redirected_to(conn) == step_path(conn, :index)
    refute Repo.get(Step, step.id)
  end
end
