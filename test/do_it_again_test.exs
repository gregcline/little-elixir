defmodule DoItAgainTest do
  use ExUnit.Case, async: true
  import DoItAgain

  describe "DoItAgain.lat?/1" do
    test "returns true if the list is a list of atoms and false otherwise" do
      assert lat?([:a, :b, :c])
      refute lat?([:a, [:b], :c])
      assert lat?([])
    end

    test "errors if the input isn't a list" do
      catch_error lat?(:a)
    end
  end

  describe "DoItAgain.member?/2" do
    test "returns true if `a` is in `list`, false otherwise" do
      assert member?(:b, [:a, :b, :c])
      refute member?(:pickle, [:a, :b, :c])
    end
  end
end
