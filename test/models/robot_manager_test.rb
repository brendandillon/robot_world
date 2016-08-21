require_relative '../test_helper'

class RobotManagerTest < Minitest::Test
  
  include TestHelpers

  def create_robot
    robot_manager.create({
      :name => "Davros",
      :city => "Skaro",
      :state => "Wyoming",
      :birthdate => "1968-12-22",
      :date_hired => "2012-09-05",
      :department => "EXTERMINATION"
    })
  end


  def number_of_robots
    robot_manager.all.count
  end

  def id_of_robot
    robot_manager.all.last.id
  end

  def test_it_creates_a_robot
    assert_equal 0, number_of_robots

    create_robot

    assert_equal 1, number_of_robots
  end

  def test_it_finds_all_robots
    assert_equal 0, number_of_robots

    create_robot
    create_robot
    create_robot

    assert_instance_of Robot, robot_manager.all.first
    assert_equal 3, number_of_robots
  end

  def test_it_finds_one_robot
    create_robot
    
    actual = robot_manager.find(id_of_robot)

    assert_instance_of Robot, actual 
    assert_equal "Davros", actual.name
  end

  def test_it_updates_a_robot
    create_robot

    robot_manager.update(id_of_robot, { 
      :name => "bill",
      :city => "Skaro",
      :state => "Wyoming",
      :birthdate => "1968-12-22",
      :date_hired => "2012-09-05",
      :department => "EXTERMINATION"
    })
    actual = robot_manager.find(id_of_robot)

    assert_equal "bill", actual.name
  end

  def test_it_deletes_a_robot
    create_robot
    assert_equal 1, number_of_robots

    robot_manager.delete(id_of_robot)
    assert_equal 0, number_of_robots
  end

  def test_it_deletes_all_robots
    create_robot
    create_robot
    create_robot
    assert_equal 3, number_of_robots

    robot_manager.delete_all
    assert_equal 0, number_of_robots
  end
end
