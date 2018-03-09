require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1
    # arrange
    robot = Robot.new()
    robot.needs_repairs = true
    robot.foreign_model = true
    robot.vintage_model = false

    # act
    expected = 1
    actual = robot.station

    # assert
    assert_equal(expected, actual)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    # arrange
    robot = Robot.new()
    robot.needs_repairs = true
    robot.foreign_model = false
    robot.vintage_model = true

    # act
    expected = 2
    actual = robot.station

    # assert
    assert_equal(expected, actual)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    # arrange
    robot = Robot.new()
    robot.needs_repairs = true
    robot.foreign_model = false
    robot.vintage_model = false

    # act
    expected = 3
    actual = robot.station

    # assert
    assert_equal(expected, actual)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    # arrange
    robot = Robot.new()
    robot.needs_repairs = false
    robot.foreign_model = true
    robot.vintage_model = true

    # act
    expected = 4
    actual = robot.station

    # assert
    assert_equal(expected, actual)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    # arrange
    robot = Robot.new()

    # act
    expected = -1
    actual = robot.prioritize_tasks

    # assert
    assert_equal(expected, actual)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # arrange
    robot = Robot.new()
    robot.todos = [15, 20, 1, 30, 3]

    # act
    expected = 30
    actual = robot.prioritize_tasks

    # assert
    assert_equal(expected, actual)
  end

  def test_workday_on_day_off_returns_false
    # arrange
    robot = Robot.new()
    robot.day_off = 20180202

    # act
    expected = false
    actual = robot.workday?(20180202)

    # assert
    assert_equal(expected, actual)
  end

  def test_workday_not_day_off_returns_true
    # arrange
    robot = Robot.new()
    robot.day_off = 20180201

    # act
    expected = true
    actual = robot.workday?(20180202)

    # assert
    assert_equal(expected, actual)
  end

end
