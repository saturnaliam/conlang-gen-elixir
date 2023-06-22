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

    # different categories
    writing_systems = ["Abugida", "Abjad", "Alphabet", "Logosyllabary", "Syllabary"]

    families = [
      "Niger-Congo",
      "Austronesian",
      "Trans New-Guinea",
      "Sino-Tibetan",
      "Indo-European",
      "Australian",
      "Afro-Asiatic",
      "Nilo-Saharan",
      "Oto-Manguean",
      "Kra-Dai",
      "Dravidian",
      "Tupian"
    ]

    # generating writing
    writing =
      IO.gets("Should I generate a writing system? [Y/N] ")
      |> gen_system.(writing_systems)

    # generating family
    family =
      IO.gets("Should I generate a language family for you? [Y/N] ") |> gen_system.(families)

    IO.puts(writing <> " " <> family)
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
