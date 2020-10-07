defmodule MclusterServerTest do
  use ExUnit.Case
  doctest MclusterServer

  test "greets the world" do
    assert MclusterServer.hello() == :world
  end
end
