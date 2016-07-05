defmodule DoItAgain do
  alias Chapters

  @spec lat?(list) :: boolean
  def lat?([]), do: true
  def lat?([head | tail]) do
    cond do
      is_atom(head) -> lat?(tail)
      true -> false
    end
  end

  @spec member?(atom, list) :: boolean
  def member?(_, []), do: false
  def member?(a, [head | tail]) do
    cond do
      a == head -> true
      true -> member?(a, tail)
    end
  end
end
