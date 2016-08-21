require_relative "../test_helper"

class UserCreatesARobotTest < FeatureTest
  
  def test_user_creates_a_robot
    visit '/'
    click_link('Submit New Robot')
    
    fill_in("robot[name]", with:"Gary")
    fill_in("robot[city]", with:"Billings")
    fill_in("robot[state]", with:"Montana")
    fill_in("robot[birthdate]", with:"1972-8-7")
    fill_in("robot[date_hired]", with:"1999-8-16")
    fill_in("robot[department]", with:"Human Resources")
    click_button("submit")

    assert page.has_content?("Gary")
    assert page.has_content?("Billings, Montana")
  end

end
