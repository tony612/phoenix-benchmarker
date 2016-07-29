defmodule Benchmarker.SessionView do
  use Benchmarker.Web, :view

  def render("show.json", %{user: user}) do
    %{id: user.id,
      email: user.email,
      nickname: user.nickname,
      avatar: user.avatar,
    }
  end
end
