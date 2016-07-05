defmodule ConsMagnificent do
  @spec rember(atom, list) :: list
  def rember(_, []), do: []
  def rember(a, [head | tail]) do
    cond do
      a == head -> tail
      true -> [head | rember(a, tail)]
    end
  end

  @spec firsts([list]) :: list
  def firsts([]), do: []
  def firsts([[a | _] | tail]) do
    [a | firsts(tail)]
  end

  @spec insertR(atom, atom, list) :: list
  def insertR(_, _, []), do: []
  def insertR(new, old, [head | tail]) do
    cond do
      head == old -> [old | [new | tail]]
      true -> [head | insertR(new, old, tail)]
    end
  end

  @spec insertL(atom, atom, list) :: list
  def insertL(_, _, []), do: []
  def insertL(new, old, [head | tail]) do
    cond do
      head == old -> [new | [old | tail]]
      true -> [head | insertL(new, old, tail)]
    end
  end

  @spec subst(atom, atom, list) :: list
  def subst(_, _, []), do: []
  def subst(new, old, [head | tail]) do
    cond do
      head == old -> [new | tail]
      true -> [head | subst(new, old, tail)]
    end
  end

  @spec subst(atom, atom, atom, list) :: list
  def subst(_, _, _, []), do: []
  def subst(new, o1, o2, [head | tail]) do
    cond do
      head == o1 or head == o2 -> [new | tail]
      true -> [head | subst(new, o1, o2, tail)]
    end
  end

  @spec multirember(atom, list) :: list
  def multirember(_, []), do: []
  def multirember(a, [head | tail]) do
    cond do
      head == a -> multirember(a, tail)
      true -> [head | multirember(a, tail)]
    end
  end

  @spec multiinsertR(atom, atom, list) :: list
  def multiinsertR(_, _, []), do: []
  def multiinsertR(new, old, [head | tail]) do
    cond do
      head == old -> [old | [new | multiinsertR(new, old, tail)]]
      true -> [head | multiinsertR(new, old, tail)]
    end
  end

  @spec multiinsertL(atom, atom, list) :: list
  def multiinsertL(_, _, []), do: []
  def multiinsertL(new, old, [head | tail]) do
    cond do
      head == old -> [new | [old | multiinsertL(new, old, tail)]]
      true -> [head | multiinsertL(new, old, tail)]
    end
  end

  @spec multisubst(atom, atom, list) :: list
  def multisubst(_, _, []), do: []
  def multisubst(new, old, [head | tail]) do
    cond do
      head == old -> [new | multisubst(new, old, tail)]
      true -> [head | multisubst(new, old, tail)]
    end
  end
end