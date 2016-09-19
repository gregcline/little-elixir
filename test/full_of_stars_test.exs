defmodule FullOfStarsTest do
  use ExUnit.Case, async: true
  import FullOfStars

  describe "FullOfStars.rember_star2" do
    test "removes all instances of `a` from the list" do
      assert rember_star([[:a], :z, [[:b], :z], [:c, [:d]], :z], :z) == [[:a], [[:b]], [:c, [:d]]]
    end
  end

  describe "FullOfStars.insertR_star/3" do
    test "inserts `new` to the right of every `old` in the list" do
      l = [[:how, :much, [:wood]],
            :could,
            [[:a, [:wood], :chuck]],
            [[[:chuck]]],
            [:if, [:a], [[:wood, :chuck]]],
            :could, :chuck, :wood]
      assert insertR_star(:roast, :chuck, l)
            == [[:how, :much, [:wood]],
                :could,
                [[:a, [:wood], :chuck, :roast]],
                [[[:chuck, :roast]]],
                [:if, [:a], [[:wood, :chuck, :roast]]],
                :could, :chuck, :roast, :wood]
    end
  end

  describe "FullOfStars.occur_star/2" do
    test "counts how many `a` in the list recursively" do
      l = [[:banana],
           [:split, [[[[:banana, :ice]]],
                    [:cream, [:banana]],
                    :sherbet]],
           [:banana],
           [:bread],
           [:banana, :brandy]]
      assert occur_star(l, :banana) == 5
    end
  end

  describe "FullOfStars.subst_star/3" do
    l = [[:orange],
           [:split, [[[[:orange, :ice]]],
                    [:cream, [:orange]],
                    :sherbet]],
           [:orange],
           [:bread],
           [:orange, :brandy]]
    assert subst_star(l, :banana, :orange) ==
        [[:banana],
           [:split, [[[[:banana, :ice]]],
                    [:cream, [:banana]],
                    :sherbet]],
           [:banana],
           [:bread],
           [:banana, :brandy]]
  end

  describe "FullOfStars.insertL_star/3" do
    test "inserts `new` to the right of every `old` in the list" do
      l = [[:how, :much, [:wood]],
            :could,
            [[:a, [:wood], :chuck]],
            [[[:chuck]]],
            [:if, [:a], [[:wood, :chuck]]],
            :could, :chuck, :wood]
      assert insertL_star(:pecker, :chuck, l)
            == [[:how, :much, [:wood]],
                :could,
                [[:a, [:wood], :pecker, :chuck]],
                [[[:pecker, :chuck]]],
                [:if, [:a], [[:wood, :pecker, :chuck]]],
                :could, :pecker, :chuck, :wood]
    end
  end

  describe "FullOfStars.member_star/2" do
    test "true if `a` in the list recursively, false otherwise" do
      assert member_star([:a, :b, [[[[:c]], :d]]], :c) == true
      assert member_star([:a, :b, [[[:d]]]], :c) == false
    end
  end

  describe "FullOfStars.leftmost/1" do
    test "finds the left most atom in a list" do
      assert leftmost([[[[:a]]], :c]) == :a
    end
  end

  describe "FullOfStars.eqlist?/2" do
    test "checks if two lists are exactly equal" do
      l1 = [:beef, [[:sausage]], [:and, [:soda]]]
      l2 = [:beef, [[:salami]], [:and, [:soda]]]
      l3 = [:beef, [:sauasge], [:and, [:soda]]]

      assert eqlist?(l1, l1)
      refute eqlist?(l1, l2)
      refute eqlist?(l1, l3)
    end
  end
end
