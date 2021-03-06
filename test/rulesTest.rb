require 'rubygems'
gem 'mocha'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/unit'
require 'mocha/mini_test'
require_relative '../model/rules'

describe 'Rules class' do
  it 'is player winner: should return true if player has 3 y in a row' do
    rules = Rules.new
    testCase = [
      [{x: 0, y: 0}, {x: 0, y: 1}, {x: 0, y: 2}],
      [{x: 0, y: 2}, {x: 0, y: 1}, {x: 0, y: 0}],
      [{x: 0, y: 0}, {x: 0, y: 2}, {x: 0, y: 1}]]

    3.times do |i|
      assert_equal rules.is_player_winner(testCase[i]), true
    end
  end

  it 'is player winner: should return false if player does not have 3 y in a row' do
    rules = Rules.new
    testCase = [
      [{x: 1, y: 0}, {x: 0, y: 1}, {x: 0, y: 2}],
      [{x: 0, y: 2}, {x: 2, y: 1}, {x: 0, y: 0}],
      [{x: 0, y: 0}, {x: 0, y: 2}, {x: 1, y: 2}]]

    3.times do |i|
      assert_equal rules.is_player_winner(testCase[i]), false
    end
  end

  it 'is player winner: should be true if player has 3 x in a row' do
    rules = Rules.new
    testCase = [
      [{x: 0, y: 0}, {x: 1, y: 0}, {x: 2, y: 0}],
      [{x: 2, y: 0}, {x: 1, y: 0}, {x: 0, y: 0}],
      [{x: 0, y: 0}, {x: 2, y: 0}, {x: 1, y: 0}]]
    
    3.times do |i| 
      assert_equal rules.is_player_winner(testCase[i]), true
    end    
  end

  it 'is player winner: should be false if player does not have 3 x in a row' do
      rules = Rules.new
      testCase = [
        [{x: 0, y: 0}, {x: 1, y: 0}, {x: 2, y: 1}],
        [{x: 2, y: 0}, {x: 1, y: 2}, {x: 0, y: 0}],
        [{x: 0, y: 1}, {x: 2, y: 0}, {x: 1, y: 0}]]
      
      3.times do |i| 
        
        assert_equal rules.is_player_winner(testCase[i]), false
      end    
    end


  it 'is player winner: should be true if player has diagonal 3' do
    rules = Rules.new

    testCase = [
      [{x: 0, y: 0}, {x: 1, y: 1}, {x: 2, y: 2}],
      [{x: 0, y: 2}, {x: 1, y: 1}, {x: 2, y: 0}]]
    
    2.times do |i| 
      assert_equal rules.is_player_winner(testCase[i]), true
    end
  end

  it 'is player winner: should be false if player does not hav diagonal 3' do
    rules = Rules.new

    testCase = [
      [{x: 1, y: 2}, {x: 1, y: 1}, {x: 2, y: 2}],
      [{x: 0, y: 2}, {x: 0, y: 1}, {x: 2, y: 0}]]
    
    2.times do |i| 
      assert_equal rules.is_player_winner(testCase[i]), false
    end
  end

end
