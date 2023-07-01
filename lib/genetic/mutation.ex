defmodule Genetic.Mutation do
  alias Genetic.Fitness

  def mutate_chromosome(chromosome) do
    keep_mutating(-1, chromosome)
  end

  defp keep_mutating(change, chromosome) when change == 0, do: chromosome
  defp keep_mutating(change, chromosome) when change != 0 do
    index = chromosome |> get_heuristic |> get_index
    max_fitness = Fitness.get_fitness(chromosome)

    {change, _} =
    Enum.reduce(1..8, {0, max_fitness}, fn y, {c, m} ->
      tmp = List.replace_at(chromosome, index, y)
      current_fitness = Fitness.get_fitness(tmp)
      if current_fitness < m do
        m = current_fitness
        {y, m}
      else
        {c, m}
      end
    end)

    chromosome = if change == 0 do
      unused = Enum.to_list(1..8) -- chromosome
      if length(unused) != 0 do
        i = -1
        Enum.reduce(0..(length(chromosome)-2), chromosome, fn x, acc ->
          Enum.reduce((x+1)..(length(chromosome)-1), acc, fn y, acc1 ->
            if Enum.at(acc1, x) == Enum.at(acc1, y) do
              i = i + 1
              List.replace_at(acc1, y, Enum.at(unused, i))
            else
              acc1
            end
          end)
        end)
      else
        chromosome
      end
    else
      List.replace_at(chromosome, index, change)
    end

    keep_mutating(change, chromosome)
  end

  def get_heuristic(chromosome) do
      Enum.reduce(0..(length(chromosome)-1), [], fn x, acc ->
        y = x - 1
        acc = acc ++ [0]

        acc = if y > -1 do
          Enum.reduce(y..0, acc, fn i, acc1 ->
            if (Enum.at(chromosome, x) == Enum.at(chromosome, i)) or (abs(Enum.at(chromosome, x) - Enum.at(chromosome, i)) == abs(x - i)) do
              List.replace_at(acc1, x, (Enum.at(acc1, x) + 1))
            else
              acc1
            end
          end)
        else
          acc
        end
        y = x + 1
        acc = if y < (length(chromosome)) do
          Enum.reduce(y..(length(chromosome)-1), acc, fn i, acc1 ->
            if (Enum.at(chromosome, x) == Enum.at(chromosome, i)) or (abs(Enum.at(chromosome, x) - Enum.at(chromosome, i)) == abs(x - i)) do
              List.replace_at(acc1, x, (Enum.at(acc1, x) + 1))
            else
              acc1
            end
          end)
        else
          acc
        end
        acc
      end)
  end

  def get_index(chromosome) do
    max = Enum.max(chromosome)
    chromosome
    |> Enum.with_index
    |> Enum.reduce(0, fn {element, index}, acc ->
      if element == max do
        index
      else
        acc
      end
    end)
  end
end