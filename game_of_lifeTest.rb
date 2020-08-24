require "test/unit/assertions"
require_relative 'game_of_life'

include Test::Unit::Assertions

class gameOfLifeTest
  def test_change
    testInput = [[0,0,0], [1,1,1], [0,0,0]]
    expectedOutput = [[0,1,0],[0,1,0],[0,1,0]]
    output = game_of_life(testinput)
    assert_equal output, expectedOutput, "The output is different form the expected output"
  end

  def test_noChange
    testInput = [[1,1], [1,1]]
    expectedOutput = [[1,1], [1,1]]
    output = game_of_life(testinput)
    assert_equal output, expectedOutput, "The output is different form the expected output"
  end
end
