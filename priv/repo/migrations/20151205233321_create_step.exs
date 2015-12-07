defmodule SampleServices.Repo.Migrations.CreateStep do
  use Ecto.Migration

  def change do
    create table(:steps) do
      add :beat, :string
      add :url, :string
      add :name, :string

      timestamps
    end

  end
end
