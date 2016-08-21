require_relative '../test_helper'

class RobotTest < Minitest::Test

  include TestHelpers

  def setup
    @robot = Robot.new({
      "name" => "Davros",
      "city" => "Skaro",
      "state" => "Wyoming",
      "birthdate" => "1968-12-22",
      "date_hired" => "2012-09-05",
      "department" => "EXTERMINATION"
    })
  end
  
  def test_it_has_a_name
    assert_equal "Davros", @robot.name
  end

  def test_it_has_a_city
    assert_equal "Skaro", @robot.city
  end

  def test_it_has_a_state
    assert_equal "Wyoming", @robot.state
  end

  def test_it_has_an_avatar
    assert_equal "https://robohash.org/Davros", @robot.avatar
  end

  def test_it_has_a_birthdate
    assert_equal Time.new(1968, 12, 22), @robot.birthdate
  end

  def test_it_has_a_hire_date
    assert_equal Time.new(2012, 9, 5), @robot.date_hired
  end

  def test_it_has_a_department
    assert_equal "EXTERMINATION", @robot.department
  end
end
