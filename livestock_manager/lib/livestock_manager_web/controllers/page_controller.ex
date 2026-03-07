defmodule LivestockManagerWeb.PageController do
  use LivestockManagerWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
