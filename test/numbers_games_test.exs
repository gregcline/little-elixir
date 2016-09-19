defmodule NumbersGamesTest do
  use ExUnit.Case, async: true
  import NumbersGames

  describe "NumbersGames.plus/2" do
    test "adds `b` to `a` when both `a` and `b` are greater than 0" do
      assert plus(46, 12) == 58
      assert plus(0, 3) == 3
    end
  end

  describe "NumbersGames.minus/2" do
    test "subtracts `b` from `a` down to 0" do
      assert minus(14, 3) == 11
      assert minus(17, 9) == 8
    end
  end

  describe "NumbersGames.addtup/1" do
    test "sums the numbers in a tup (list of numbers)" do
      assert addtup([3, 5, 2, 8]) == 18
      assert addtup([15, 6, 7, 12, 3]) == 43
    end
  end

  describe "NumbersGames.times/2" do
    test "multiplies two numbers together" do
      assert times(5, 3) == 15
      assert times(13, 4) == 52
    end
  end

  describe "NumbersGames.addtup/2" do
    test "adds respective entries in two tups" do
      assert addtup([3, 6, 9, 11, 4], [8, 5, 2, 0, 7]) == [11, 11, 11, 11, 11]
      assert addtup([3, 7, 8, 1], [4, 6]) == [7, 13, 8, 1]
    end
  end

  describe "NumbersGames.greater/2" do
    test "determines whether `a` is greater than `b`" do
      assert greater(12, 1)
      refute greater(12, 30)
      refute greater(12, 12)
    end
  end

  describe "NumbersGames.less/2" do
    test "determines whether `a` is less than `b`" do
      assert less(12, 30)
      refute less(12, 1)
      refute less(12, 12)
    end
  end

  describe "NumbersGames.equal/2" do
    test "determines if two numbers are equal" do
      assert equal(11, 11)
      refute equal(12, 11)
      refute equal(11, 12)
    end
  end

  describe "NumbersGames.pow/2" do
    test "raises `a` to the power of `b`" do
      assert pow(1, 1) == 1
      assert pow(2, 3) == 8
    end
  end

  describe "NumbersGame.div/2" do
    test "divides `a` by `b`" do
      assert divide(20, 5) == 4
      assert divide(35, 5) == 7
      assert divide(15, 4) == 3
    end
  end

  describe "NumbersGame.len/1" do
    test "counts the length of a list" do
      assert len([:a, :b, :c, :d]) == 4
    end
  end

  describe "NumbersGame.pick/2" do
    test "gets the atom at location `a`" do
      assert pick([:a, :b, :c], 2) == :b
      assert pick([:e, :d, :c, :b, :a], 4) == :b
    end
  end

  describe "NumbersGame.rempick/2" do
    test "returns the list without the atom at `a`" do
      assert rempick([:a, :b, :c], 2) == [:a, :c]
    end
  end

  describe "NumbersGame.no_nums/1" do
    test "returns the list without any numbers" do
      assert no_nums([:a, :b, 2, :c, 6]) == [:a, :b, :c]
    end
  end

  describe "NumbersGame.all_nums/1" do
    test "returns a list with just the numbers" do
      assert all_nums([:a, :b, 2, :c, 6]) == [2, 6]
    end
  end

  describe "NumbersGame.occur/2" do
    test "counts numbers" do
      assert occur([:a, :b, 2, 6, 2, :c], 2) == 2
      assert occur([], 3) == 0
    end
    test "counts atoms" do
      assert occur([:a, :a, 3, :b, :a, 6], :a) == 3
    end
  end
end
