defmodule Genetic.Fitness do
  def get_fitness(chromosome) do
    len = length(chromosome)
    Enum.reduce(0..(len-2), 0, fn x, acc ->
      Enum.reduce((x+1)..(len-1), acc, fn y, acc1 ->
        if (Enum.at(chromosome, x) == Enum.at(chromosome, y)) or (abs(Enum.at(chromosome, y) - Enum.at(chromosome, x)) == abs(y - x)) do
          acc1 + 1
        else
          acc1
        end
      end)
    end)
  end
end