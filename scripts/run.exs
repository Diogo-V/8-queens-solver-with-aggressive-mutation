defmodule Run do
  alias Genetic.Main

  solution = Main.solve_8_queen_problem()
  Main.view(solution)
end