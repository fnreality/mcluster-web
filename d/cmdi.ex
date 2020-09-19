defmodule JR do
  def example(filename, tool) do
    cmd_args =
      [String.trim IO.gets "Enter a number: "]
      |> Enum.concat([filename])
      |> Enum.reverse
    {out, 0} = System.cmd(tool, cmd_args)
    IO.puts out
  end
end
