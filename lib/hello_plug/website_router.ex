defmodule UserRouter do
  use Router
  def route("GET", ["users", user_id], conn) do
    # this route is for /users/<user_id>
    conn |> Plug.Conn.send_resp(200, "You requested user #{user_id}")
  end
  def route("POST", ["users"], conn) do
    # do some sort of database insertion here maybe
  end
  def route(_method, _path, conn) do
    conn |> Plug.Conn.send_resp(404, "Couldn't find that user page, sorry!")
  end
end




defmodule WebsiteRouter do
  use Router

  @user_router_options UserRouter.init([])
  def route("GET", ["users" | path], conn) do
    UserRouter.call(conn, @user_router_options)
  end
  def route(_method, _path, conn) do
    conn |> Plug.Conn.send_resp(404, "Couldn't find that page, sorry!")
  end
end
