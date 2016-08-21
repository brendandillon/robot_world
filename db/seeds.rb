require 'sqlite3'

database = SQLite3::Database.new("db/robot_manager_development.db")

database.execute("DELETE FROM robots;")

database.execute("INSERT INTO robots
                 (name, city, state, avatar, birthdate, date_hired, department)
                 VALUES
                  ('bob', 'madison', 'wi', 01010, '12-12-2012', '12-12-2013', 'processing'),
                  ('anna', 'atlanta', 'ga', 01010, '9-13-1952', '4-23-2009', 'accounts recievable'),
                  ('c3p0', 'tattooine', 'kashi', 01010, '01-01-1994', '01-02-1998', 'human-cyborg relations');"
                )

puts "it worked and: "
p database.execute("SELECT * FROM robots;")
