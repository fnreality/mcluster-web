defmodule MclusterServer.Internal.Create do

    def create_asm exec do
	{asm, 0} = System.cmd("bash", ["shell/disasm.sh", exec])
	asm
    end

    def create_graph asm do
	AsmGraph.graph asm
    end

    def create_clustering graph do
	{clustering, 0} = System.cmd("bash", ["shell/cluster_graph.sh", graph])
	clustering
    end

    def create_result clustering do
	clustering
    end

end
