defmodule CG do
  def generate_conlang do
    langs = ["english", "spanish"]
    IO.puts("#{Enum.random(langs)}")
  end
end
