defmodule CG do
  def generate_conlang do
    gen_system = fn input, options ->
      input = String.downcase(input) |> String.trim("\n")

      case input do
        "y" ->
          Enum.random(options)

        "q" ->
          exit(:exit)

        _ ->
          nil
      end
    end

    open_file = fn file ->
      File.read!(file) |> String.trim("\n") |> String.trim("\r") |> String.split("/")
    end

    # different categories
    writing_systems = open_file.("writing")
    inflections = open_file.("inflections")
    families = open_file.("families")

    # generating writing
    writing =
      IO.gets("Should I generate a writing system? [Y/N] ")
      |> gen_system.(writing_systems)

    # generating family
    family =
      IO.gets("Should I generate a language family for you? [Y/N] ") |> gen_system.(families)

    # generating morphology
    inflection =
      IO.gets("Should I generate an inflection for you? [Y/N] ") |> gen_system.(inflections)

    # printing out the shi
    if !writing && !family && !inflection do
      IO.puts("Please select an option, or enter \"q\" to exit.")
      generate_conlang()
    else
      IO.puts("Create a language that:")

      if writing, do: IO.puts("Has a(n) #{writing} writing system.")
      if family, do: IO.puts("Is a part of the #{family} family.")
      if inflection, do: IO.puts("Has #{inflection} inflection.")
    end

    :ok
  end

  def repl do
    user_input = IO.gets("> ") |> String.trim("\n")

    case user_input do
      "gen" ->
        generate_conlang()

      "exit" ->
        exit(:exit)

      _ ->
        IO.puts("Unknown command #{user_input}")
    end

    IO.puts("")
    repl()
  end
end
