require 'time'
class RobotManager
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(robot)
    database.execute("INSERT INTO robots (name, city, state, birthdate, date_hired, department) 
                     VALUES (?, ?, ?, ?, ?, ?);",
                     robot[:name], 
                     robot[:city], 
                     robot[:state], 
                     robot[:birthdate], 
                     robot[:date_hired], 
                     robot[:department])
  end

  def raw_bots
    database.execute("SELECT * FROM robots;")
  end

  def all
    raw_bots.map { |data| Robot.new(data) }
  end

  def raw_bot(id)
    database.execute("SELECT * FROM robots WHERE id=?;", id).first
  end

  def find(id)
    Robot.new(raw_bot(id))
  end

  def update(id, robot)
    database.execute("UPDATE robots
                     SET name=?,
                         city=?,
                         state=?,
                         birthdate=?,
                         date_hired=?,
                         department=?
                      WHERE id=?;",
                     robot[:name], 
                     robot[:city], 
                     robot[:state], 
                     robot[:birthdate], 
                     robot[:date_hired], 
                     robot[:department],
                     id
                    )

  end

  def delete(id)
    database.execute("DELETE FROM robots WHERE id=?;", id)
  end

  def delete_all
    database.execute("DELETE FROM robots;")
  end
end
