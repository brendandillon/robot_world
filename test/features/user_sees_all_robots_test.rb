require_relative "../test_helper"

class UserSeesAllRobotsTest < FeatureTest

  include TestHelpers

  def test_user_sees_all_robots
    create_robot
    visit "/"
    click_link("All Robots")

    assert page.has_content?("Davros")
  end
end
