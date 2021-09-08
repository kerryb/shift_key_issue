defmodule ShiftKeyIssue.Repo.Migrations.CreateBar do
  use Ecto.Migration

  def change do
    create table(:bar) do

      timestamps()
    end
  end
end
