defmodule NumbersGames do
  @spec plus(integer, integer) :: integer
  def plus(a, 0), do: a
  def plus(a, b), do: 1 + plus(a, b - 1)

  @spec minus(integer, integer) :: integer
  def minus(a, 0), do: a
  def minus(a, b), do: minus(a, b - 1) - 1

  @spec addtup([integer]) :: integer
  def addtup([]), do: 0
  def addtup([head | tail]), do: plus(head, addtup(tail))

  @spec times(integer, integer) :: integer
  def times(_, 0), do: 0
  def times(a, b), do: plus(a, times(a, b - 1))

  @spec addtup([integer], [integer]) :: [integer]
  def addtup([], b), do: b
  def addtup(a, []), do: a
  def addtup([head1 | tail1], [head2 | tail2]) do
    [plus(head1, head2) | addtup(tail1, tail2)]
  end

  @spec greater(integer, integer) :: boolean
  def greater(0, _), do: false
  def greater(_, 0), do: true
  def greater(a, b), do: greater(a - 1, b - 1)

  @spec less(integer, integer) :: boolean
  def less(_, 0), do: false
  def less(0, _), do: true
  def less(a, b), do: less(a - 1, b - 1)

  # @spec equal(integer, integer) :: boolean
  # def equal(0, 0), do: true
  # def equal(0, _), do: false
  # def equal(_, 0), do: false
  # def equal(a, b), do: equal(a - 1, b - 1)
  
  @spec equal(integer, integer) :: boolean
  def equal(a, b) do
    cond do
      greater(a, b) -> false
      less(a, b) -> false
      true -> true
    end
  end

  @spec pow(integer, integer) :: integer
  def pow(_, 0), do: 1
  def pow(a, b), do: times(a, pow(a, b - 1))

  @spec divide(integer, integer) :: integer
  def divide(a, b) do
    cond do
      less(a, b) -> 0
      true -> (1 + divide(minus(a, b), b))
    end
  end

  @spec len(list) :: integer
  def len([]), do: 0
  def len([_ | tail]), do: (1 + len(tail))

  @spec pick(list, integer) :: atom
  def pick([head | _], 1), do: head
  def pick([_ | tail], a), do: pick(tail, a - 1)

  @spec rempick(list, integer) :: list
  def rempick([_ | tail], 1), do: tail
  def rempick([head | tail], a), do: [head | rempick(tail, a - 1)]

  @spec no_nums(list) :: list
  def no_nums([]), do: []
  def no_nums([head | tail]) when is_number(head), do: no_nums(tail)
  def no_nums([head | tail]), do: [head | no_nums(tail)]

  @spec all_nums(list) :: list
  def all_nums([]), do: []
  def all_nums([head | tail]) when is_number(head), do: [head | all_nums(tail)]
  def all_nums([_ | tail]), do: all_nums(tail)

  @spec occur(list, atom|number) :: number
  def occur([], _), do: 0
  def occur([searched | tail], searched), do: occur(tail, searched) + 1
  def occur([_ | tail], searched), do: occur(tail, searched)
end
