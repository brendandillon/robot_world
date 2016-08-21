require 'time'
class StatisticsManager
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def average_birthday 
    database.execute("SELECT AVG(birthdate) FROM robots;")
    .first["AVG(birthdate)"].to_s
  end

  def average_age
    return if average_birthday == ""
    (Time.now.year - Time.strptime(average_birthday, "%Y").year)
  end

  def sort_database_results(result, criteria)
    result.reduce(Hash.new {0}) do |sorted, robot|
      sorted[robot[criteria]] += 1
      sorted
    end
  end


  def robots_by_date_hired
    sort_database_results(date_hired_for_all_robots, "date_hired")
  end

  def date_hired_for_all_robots
    database.execute("SELECT strftime('%Y', date_hired) 
                       AS date_hired 
                       FROM robots;")
  end

  def robots_by_department
    sort_database_results(department_for_all_robots, "department")
  end

  def department_for_all_robots
    database.execute("SELECT department FROM robots;")
  end

  def robots_by_city
    sort_database_results(city_for_all_robots, "city")
  end

  def city_for_all_robots
    database.execute("SELECT city FROM robots;")
  end

  def robots_by_state
    sort_database_results(state_for_all_robots, "state")
  end

  def state_for_all_robots
    database.execute("SELECT state FROM robots;")
  end
end
