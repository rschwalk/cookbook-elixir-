defmodule ListFilesRec do
  def main(args) do
    args
    |> parse_args
    |> list_all
    |> IO.inspect
  end

  defp list_all([]) do
    IO.puts(:stderr, "Path is needed as first argument!")
    {:error, "Path is missing"}
  end
  defp list_all(path) do
    expand(File.ls(path), path)
  end

  defp expand({:ok, files}, path) do
    files
    |> Enum.flat_map(&list_all("#{path}/#{&1}"))
  end
  defp expand({:error, _}, path) do
    [path]
  end

  defp parse_args(args) do
    {_opt, pos_args, _} = OptionParser.parse(args, strict: [])
    pos_args
  end
end
