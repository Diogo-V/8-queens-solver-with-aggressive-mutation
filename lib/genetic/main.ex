defmodule Genetic.Main do
  alias Genetic.Fitness
  alias Genetic.Crossover
  alias Genetic.Mutation

  defp populate() do
    Enum.reduce(0..7, [], fn _, acc -> acc ++ [:rand.uniform(8)] end)
  end

  def solve_8_queen_problem() do
    father = populate()
    mother = populate()

    fitness_father = Fitness.get_fitness(father)
    fitness_mother = Fitness.get_fitness(mother)

    {father, mother} = cross_and_mutate_rec(father, mother, fitness_father, fitness_mother)

    if Fitness.get_fitness(father) == 0 do
      father
    else
      mother
    end
  end

  defp cross_and_mutate_rec(father, mother, fitness_father, fitness_mother) when fitness_father == 0 or fitness_mother == 0, do: {father, mother}
  defp cross_and_mutate_rec(father, mother, fitness_father, fitness_mother) when fitness_father != 0 and fitness_mother != 0 do
    child1 = Crossover.new_child(father, mother, 4)
    child2 = Crossover.new_child(mother, father, 4)

    child1 = Mutation.mutate_chromosome(child1)
    child2 = Mutation.mutate_chromosome(child2)

    fitness_child1 = Fitness.get_fitness(child1)
    fitness_child2 = Fitness.get_fitness(child2)

    cross_and_mutate_rec(child1, child2,  fitness_child1,  fitness_child2)
  end

  def view(solution) do
    IO.write "Solution to the 8-Queen problem: "
    IO.inspect solution
    IO.puts ' '

    Enum.reduce(0..7, solution, fn x, acc ->
      acc = List.replace_at(acc, x, (Enum.at(acc, x) - 1))
      Enum.each(0..7, fn y ->
        if y == (Enum.at(acc, x)) do
          IO.write ' |Q|'
        else
          IO.write ' |-|'
        end
      end)
      IO.puts ' '
      acc
    end)
  end
end