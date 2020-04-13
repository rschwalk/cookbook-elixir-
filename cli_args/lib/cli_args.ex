defmodule CliArgs do
  @moduledoc """
  Documentation for CliArgs.
  """

  @doc """
  Hello world.

  ## Examples

      iex> CliArgs.hello()
      :world

  """
  def main(args) do
    args |> parse_arguments |> process
  end

  def process([]) do
    IO.puts "No arguments given"
  end
  def process({options, pos_args}) do
    IO.puts "Hello #{options[:name]}"
    IO.puts "Positinal arguments: #{pos_args}"
  end

  defp parse_arguments(args) do
    {options, pos_args, _} = OptionParser.parse(args,
      aliases: [n: :name],
      strict: [name: :string]
    )
    {options, pos_args}
  end
end
