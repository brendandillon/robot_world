require_relative "../test_helper"

class UserDeletesARobotTest < FeatureTest
  
  include TestHelpers

  def test_a_user_deletes_a_robot
    create_robot

    visit '/'
    click_link("All Robots")
    click_button("Delete")

    refute page.has_content?("Davros")
  end
end
