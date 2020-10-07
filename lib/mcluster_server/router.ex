defmodule MclusterServer.Router do
    use Plug.Router
    plug :match
    plug :dispatch

    get "/" do
	exec_handler = spawn MclusterServer.Internal.Handle, :exec
	send exec_handler, %{exec: "<TEST-EXEC>", sender: self}
	receive do
	    %{res: res} ->
		send_resp conn, 200, res
	end 
    end

    match _, do: send_resp conn, 404, "Not Found"
end
