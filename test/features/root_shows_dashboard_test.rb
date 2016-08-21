require_relative "../test_helper"

class RootShowsDashboardTest < FeatureTest
  def test_dashboard_headings_displayed
    visit '/'
    within("header") do
      assert page.has_content?("Welcome to Robot World")
    end

    assert page.has_content?("Average Age of Robots")
    assert page.has_content?("Robots From Each City")
    assert page.has_content?("Robots Hired Each Year")
    assert page.has_content?("Robots From Each State")
    assert page.has_content?("Robots In Each Department")
  end
end
