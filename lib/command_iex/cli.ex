defmodule CommandIex.CLI do
  def run(argv) do
    parse_args(argv)
  end

  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [c: :boolean], aliases: [ c: :code ])
    case parse do
      { [ code: code ], args, _ } -> { :code, code, args }
      _ -> { :error, "", [] }
    end
  end
end
