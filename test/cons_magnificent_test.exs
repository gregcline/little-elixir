defmodule ConsMagnificentTest do
  use ExUnit.Case, async: true
  import ConsMagnificent

  describe "ConsMagnificent.rember/2" do
    test "removes the first occurence of `a` in a `list`" do
      assert rember(:mint, [:lamb, :chops, :and, :mint, :jelly]) 
        == [:lamb, :chops, :and, :jelly]
      assert rember(:mint, [:lamb, :chops, :and, :mint, :flavored, :mint, :jelly])
        == [:lamb, :chops, :and, :flavored, :mint, :jelly]
    end
  end

  describe "ConsMagnificent.firsts/1" do
    test "takes the first element of each sublist in a list of lists" do
      assert firsts([[:a, :c], [:b, :d]]) == [:a, :b]
    end
  end

  describe "ConsMagnificent.insertR/3" do
    test "takes `new` and inserts it after `old` in `list`" do
      assert insertR(:d, :c, [:a, :b, :c, :e, :f]) == [:a, :b, :c, :d, :e, :f]
    end
  end

  describe "ConsMagnificent.insertL/3" do
    test "takes `new` and inserts it before `old` in `list`" do
      assert insertL(:d, :e, [:a, :b, :c, :e, :f]) == [:a, :b, :c, :d, :e, :f]
    end
  end

  describe "ConsMagnificent.subst/3" do
    test "replaces `old` with `new` in `list`" do
      assert subst(:d, :e, [:a, :b, :c, :e]) == [:a, :b, :c, :d]
    end
  end

  describe "ConsMagnificent.subst/4" do
    test "replaces either `o1` or `o2` with `new, whichever is first" do
      assert subst(:d, :e, :f, [:a, :b, :c, :e, :f]) == [:a, :b, :c, :d, :f]
      assert subst(:d, :e, :f, [:a, :b, :c, :f, :e]) == [:a, :b, :c, :d, :e]
    end
  end

  describe "ConsMagnificent.multirember/2" do
    test "removes all instances of `a` in `list`" do
      assert multirember(:a, [:a, :a, :a]) == []
      assert multirember(:a, [:a, :b, :a, :c, :a, :d]) == [:b, :c, :d]
    end
  end

  describe "ConsMagnificent.multiinsertR/3" do
    test "inserts `new` after every occurance of `old`" do
      assert multiinsertR(:a, :b, [:b, :b, :b]) == [:b , :a, :b, :a, :b, :a]
      assert multiinsertR(:a, :b, [:a, :b, :c, :b]) == [:a, :b, :a, :c, :b, :a]
    end
  end

  describe "ConsMagnificent.multiinsertL/3" do
    test "inserts `new` before every `old`" do
      assert multiinsertL(:a, :b, [:b, :b, :b]) == [:a, :b, :a, :b, :a, :b]
      assert multiinsertL(:a, :b, [:a, :b, :c, :b]) == [:a, :a, :b, :c, :a, :b]
    end
  end

  describe "ConsMagnificent.multisubst/3" do
    test "replaces every `old` with `new`" do
      assert multisubst(:a, :b, [:b, :b, :b]) == [:a, :a, :a]
      assert multisubst(:a, :b, [:a, :b, :c, :b]) == [:a, :a, :c, :a]
    end
  end
end