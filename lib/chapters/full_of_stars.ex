defmodule FullOfStars do
  @spec rember_star(list, atom) :: list
  def rember_star([], _), do: []
  def rember_star([head | tail], head), do: rember_star(tail, head)
  def rember_star([head | tail], search) when is_list(head) do
    [rember_star(head, search) | rember_star(tail, search)]
  end
  def rember_star([head | tail], search) do
    [head | rember_star(tail, search)]
  end

  @spec insertR_star(atom, atom, list) :: list
  def insertR_star(_, _, []), do: []
  def insertR_star(new, old, [old | tail]) do
    [old, new | insertR_star(new, old, tail)]
  end
  def insertR_star(new, old, [head | tail]) when is_list(head) do
    [insertR_star(new, old, head) | insertR_star(new, old, tail)]
  end
  def insertR_star(new, old, [head | tail]) do
    [head | insertR_star(new, old, tail)]
  end

  @spec occur_star(list, any) :: number
  def occur_star([], _), do: 0
  def occur_star([searched | tail], searched) do
    occur_star(tail, searched) + 1
  end
  def occur_star([head | tail], searched) when is_list(head) do
    occur_star(head, searched) + occur_star(tail, searched)
  end
  def occur_star([_ | tail], searched) do
    occur_star(tail, searched)
  end

  @spec subst_star(list, any, any) :: list
  def subst_star([], _, _), do: []
  def subst_star([old | tail], new, old) do
    [new | subst_star(tail, new, old)]
  end
  def subst_star([head | tail], new, old) when is_list(head) do
    [subst_star(head, new, old) | subst_star(tail, new, old)]
  end
  def subst_star([head | tail], new, old) do
    [head | subst_star(tail, new, old)]
  end

  @spec insertL_star(any, any, list) :: list
  def insertL_star(_, _, []), do: []
  def insertL_star(new, old, [old | tail]) do
    [new, old | insertL_star(new, old, tail)]
  end
  def insertL_star(new, old, [head | tail]) when is_list(head) do
    [insertL_star(new, old, head) | insertL_star(new, old, tail)]
  end
  def insertL_star(new, old, [head | tail]) do
    [head | insertL_star(new, old, tail)]
  end

  @spec member_star(list, any) :: list
  def member_star([], _), do: false
  def member_star([searched | _], searched), do: true
  def member_star([head | tail], searched) when is_list(head) do
    member_star(head, searched) || member_star(tail, searched)
  end
  def member_star([_ | tail], searched) do
    member_star(tail, searched)
  end

  @spec leftmost(list) :: atom
  def leftmost([head | _]) when is_atom(head), do: head
  def leftmost([head | _]) when is_list(head), do: leftmost(head)

  @spec eqlist?(list, list) :: boolean
  def eqlist?([], []), do: true
  def eqlist?([head | tail1], [head | tail2]) when is_atom(head) do
    eqlist?(tail1, tail2)
  end
  def eqlist?([head1 | tail1], [head2 | tail2]) when is_list(head1) and is_list(head2) do
    eqlist?(head1, head2) && eqlist?(tail1, tail2)
  end
  def eqlist?(_, _), do: false
end
