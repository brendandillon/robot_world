ENV['RACK_ENV'] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "minitest/autorun"
require "minitest/pride"
require "capybara/dsl"

module TestHelpers

  def teardown
    robot_manager.delete_all
    super
  end

  def robot_manager
    database = SQLite3::Database.new("db/robot_manager_test.db")
    database.results_as_hash = true
    RobotManager.new(database)
  end

  def statistics_manager
    database = SQLite3::Database.new("db/robot_manager_test.db")
    database.results_as_hash = true
    StatisticsManager.new(database)
  end

  def create_robot
    robot_manager.create({
      :name => "Davros",
      :city => "Skaro",
      :state => "Wyoming",
      :birthdate => "2000-01-01",
      :date_hired => "2012-09-05",
      :department => "EXTERMINATION"
    })
  end

  Capybara.app = RobotWorldApp
end

class FeatureTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers
end
