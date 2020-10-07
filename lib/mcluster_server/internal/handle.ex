defmodule MclusterServer.Internal.Handle do
    import MclusterServer.Internal.Create

    def exec do
	receive do
	    %{exec: exec, sender: router} ->
		graph = exec |> create_asm |> create_graph
		graph_handler = spawn MclusterServer.Internal.Create, :graph
		send graph_handler, %{graph: graph, router: router}
	end
    end

    def graph do
	receive do
	    %{graph: graph, router: router} ->
		with [{_, res}] <- :ets.lookup :mcluster_cache, graph do
		    send router, %{res: res}
		else
		    [] ->
			res = graph |> create_clustering |> create_result
			:ets.insert :mcluster_cache, {graph, res}
			send router, %{res: res}
		end
	end
    end

end
