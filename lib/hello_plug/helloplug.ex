defmodule Helloplug do
	use Router
	def route("GET", ["users", user_id], conn) do
		conn |> Plug.Conn.send_resp(200, "you requested user #{user_id}")
	end
	def route(_method, _path, conn) do
	    conn |> Plug.Conn.send_resp(404, "Couldn't find that page, sorry!")
	end

	defp conn_inspect(conn) do
		IO.inspect conn
		conn
	end
end

