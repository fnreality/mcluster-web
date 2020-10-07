defmodule MclusterServer.Internal.Handle do
    import MclusterServer.Internal.Create

    def exec do
	receive do
	    %{exec: exec, sender: router} ->
		matrix = exec |> make_asm |> make_graph |> make_matrix
		matrix_handler = spawn MclusterServer.Internal.Create, :matrix
		send matrix_handler, %{matrix: matrix, router: router}
	end
    end

    def matrix do
	receive do
	    %{matrix: matrix, router: router} ->
		with [{_, result}] <- :ets.lookup :mcluster_cache, matrix do
		    #?
		else
		    [] ->
			#?
		end
	end
    end

end
