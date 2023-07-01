defmodule Genetic.Crossover do
  def new_child(parent1, parent2, crossover) do
    chunk1 = Enum.slice(parent1, 0..(crossover-1))
    chunk2 = Enum.slice(parent2, crossover..7) |> Enum.shuffle
    chunk1 ++ chunk2
  end
end