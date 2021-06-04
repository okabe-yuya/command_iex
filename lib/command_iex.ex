defmodule CommandIex do
  @moduledoc """
  Documentation for `CommandIex`.
  """

  import CommandIex.CLI, only: [ run: 1 ]

  def main(argv) do
    parsed = run(argv)
    result = eval_string(parsed)

    IO.inspect(result)
  end

  defp eval_string({ :error, "", [] }), do: :error_bad_arguments
  defp eval_string({ :code, code, args }) do
    { result, _ } = Code.eval_string(code, [lst: args])
    result
  end
  defp eval_string(_), do: :caused_by_something_bugs
end
