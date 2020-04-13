defmodule CliArgsTest do
  use ExUnit.Case
  doctest CliArgs

  test "greets the world" do
    assert CliArgs.hello() == :world
  end
end
