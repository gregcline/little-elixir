defmodule Toys do
  @spec car(list) :: any
  def car(list), do: hd(list)

  @spec cdr(list) :: list
  def cdr(list), do: tl(list)

  @spec cons(any, list) :: list
  def cons(elem, list) do
    [elem | list]
  end

  @spec null?(list) :: boolean
  def null?([]), do: true
  def null?(x) when is_list(x), do: false

  @spec eq?(atom, atom) :: boolean
  def eq?(x, y) when is_atom(x) and is_atom(y), do: x == y

  @spec atom?(any) :: boolean
  def atom?(x), do: is_atom(x)
end
