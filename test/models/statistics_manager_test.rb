require_relative '../test_helper'

class StatisticsManagerTest < Minitest::Test
  
  include TestHelpers

  def create_robot_a
    robot_manager.create({
      :name => "Davros",
      :city => "Skaro",
      :state => "Wyoming",
      :birthdate => "2000-01-01",
      :date_hired => "2012-09-05",
      :department => "EXTERMINATION"
    })
  end

  def create_robot_b
    robot_manager.create({
      :name => "Davros",
      :city => "Cheyenne",
      :state => "Georgia",
      :birthdate => "1990-01-01",
      :date_hired => "2014-09-05",
      :department => "FRIENDSHIP"
    })
  end

  def setup
    create_robot_a
    create_robot_b
  end

  def test_it_can_find_the_average_age
    Time.stub :now, Time.new(2010, 01, 01) do
      assert_equal 15, statistics_manager.average_age        
    end
  end

  def test_it_breaks_down_robots_by_date_hired
    actual = statistics_manager.robots_by_date_hired
    expected = {"2014" => 1, "2012" => 1}
    assert_equal expected, actual 
  end

  def test_it_breaks_down_robots_by_department
    actual = statistics_manager.robots_by_department
    expected = {"EXTERMINATION" => 1, "FRIENDSHIP" => 1}
    assert_equal expected, actual
  end

  def test_it_breaks_down_robots_by_city
    actual = statistics_manager.robots_by_city
    expected = {"Skaro" => 1, "Cheyenne" => 1}
    assert_equal expected, actual
  end

  def test_it_breaks_down_robots_by_state
    actual = statistics_manager.robots_by_state
    expected = {"Wyoming" => 1, "Georgia" => 1}
    assert_equal expected, actual
  end
end
