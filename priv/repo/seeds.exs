# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Benchmarker.Repo.insert!(%Benchmarker.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
Enum.each 1..100000, fn (i)->
  try do
    Benchmarker.Repo.insert(%Benchmarker.User{email: "user#{i}@stress.test"})
  rescue
    e in Ecto.ConstraintError -> e
  end
end
