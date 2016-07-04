ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule ToysTest do
  use ExUnit.Case, async: true

  describe "Toys.car/1" do
    test "returns the first element in a list" do
      assert Toys.car([:a, :b, :c]) == :a
      assert Toys.car([[:a, :b], [:c, :d]]) == [:a, :b]
      assert Toys.car(Toys.car([[:a]])) == :a
    end

    test "errors on an empty list" do
      catch_error Toys.car([])
    end
  end

  describe "Toys.cdr/1" do
    test "returns the tail of a list" do
      assert Toys.cdr([:a, :b, :c]) == [:b, :c]
      assert Toys.cdr([[:a, :b], [:c, :d]]) == [[:c, :d]]
    end

    test "errors on an empty list" do
      catch_error Toys.cd([])
    end
  end

  describe "Toys.cons/2" do
    test "takes something and a list and puts something on the front of the list" do
      assert Toys.cons(:a, [:b, :c]) == [:a, :b, :c]
      assert Toys.cons(:a, []) == [:a]
      assert Toys.cons([:a, :b], [:c]) == [[:a, :b], :c]
    end
  end

  describe "Toys.null?/1" do
    test "returns true if a list is empty and false if it isn't" do
      assert Toys.null?([])
      refute Toys.null?([:a])
      refute Toys.null?([[]])
    end

    test "errors on non-lists" do
      catch_error Toys.null?(:a)
    end
  end

  describe "Toys.eq?/2" do
    test "returns true if two atoms are equal and false otherwise" do
      assert Toys.eq?(:a, :a)
      refute Toys.eq?(:a, :b)
    end

    test "errors on non-atoms" do
      catch_error Toys.eq?([])
    end
  end
end
