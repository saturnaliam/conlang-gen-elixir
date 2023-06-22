defmodule CG do
  def generate_conlang do
    gen_system = fn input, options ->
      input = String.downcase(input) |> String.trim("\n")

      if input == "y" do
        Enum.random(options)
      else
        :empty
      end
    end

    open_file = fn file ->
      File.read!(file) |> String.trim("\n") |> String.trim("\r") |> String.split("/")
    end

    # different categories
    writing_systems = open_file.("writing")

    families = open_file.("families")

    # generating writing
    writing =
      IO.gets("Should I generate a writing system? [Y/N] ")
      |> gen_system.(writing_systems)

    # generating family
    family =
      IO.gets("Should I generate a language family for you? [Y/N] ") |> gen_system.(families)

    # generating morphology

    # IO.puts("Create a language that:")
    # IO.puts(if family != :empty, do: "Is part of the #{family} language family.")
    families
  end

  def prompt_input do
    user_input = IO.gets("> ") |> String.trim("\n")

    case user_input do
      "gen" ->
        generate_conlang()

      "exit" ->
        exit(:exit)

      _ ->
        IO.puts("Unknown command #{user_input}")
        prompt_input()
    end

    prompt_input()
  end
end
