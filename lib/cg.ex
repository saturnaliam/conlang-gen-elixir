defmodule CG do
  def generate_conlang do
    gen_system = fn input, options ->
      if input == "y" do
        Enum.random(options)
      else
        :empty
      end
    end

    writing =
      IO.gets("Should I generate a writing system? [Y/N] ")
      |> String.downcase()
      |> String.trim("\n")
      |> gen_system.(["Abugida", "Abjad", "Alphabet", "Logosyllabary", "Syllabary"])

    IO.puts(writing)
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
