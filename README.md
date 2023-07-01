# 8 Queens Problem Solver With An Aggressive Mutation Genetic Algorithm

A genetic algorithm is a process of natural selection of the fittest individuals from a population to search for the best results.

The 8 Queens problem consists of placing eight queens on an 8x8 chessboard such that none of the queens attack each other.

We will solve the eight queen problem using a very simple form of genetic algorithm. We will use a modified technique that requires an aggressive mutation to decrease the time needed to find the optimal solution. We will focus less on the initial population and more on mutating the parents based on their fitness value. The position of the queens will change as much as possible to reach maximum fitness. In case the maximum fitness is not achieved in one generation, the algorithm will generate the next generation.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `queen` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:queen, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/queen>.
