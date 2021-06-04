defmodule CommandIexTest do
  use ExUnit.Case
  doctest CommandIex

  import CommandIex.CLI, only: [ parse_args: 1 ]

  test "-cオプションと想定したコードが渡される" do
    parsed = parse_args(["-c", "Enum.map(&(&1 <> 'nice'"])
    { command, val, _ } = parsed

    assert command == :code
    assert val != ""
    assert is_binary(val) == true
  end

  test "-cオプションが渡されない" do
    parsed = parse_args(["-d", "Enum.map(&(&1 <> 'nice'"])
    { command, val, _ } = parsed

    assert command == :error
    assert val == ""
    assert is_binary(val) == true
  end

  test "コードだけ渡される" do
    parsed = parse_args(["Enum.map(&(&1 <> 'nice'"])
    { command, val, _ } = parsed

    assert command == :error
    assert val == ""
    assert is_binary(val) == true
  end

  test "引数なし" do
    parsed = parse_args([])
    { command, val, _ } = parsed

    assert command == :error
    assert val == ""
    assert is_binary(val) == true
  end
end
