require_relative "../test_helper"

class UserUpdatesARobotTest < FeatureTest
  
  include TestHelpers

  def test_a_user_updates_a_robot
    create_robot
    
    visit '/'
    click_link("All Robots")
    click_link("Edit")
    assert_equal "Davros", find_field("robot[name]").value

    fill_in("robot[name]", with:"Blavros")
    click_button("submit")

    assert has_content?("Blavros")
  end
end
