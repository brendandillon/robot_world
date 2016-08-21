require 'time'

class Robot
  attr_reader :name,
              :city,
              :state,
              :avatar,
              :birthdate,
              :date_hired,
              :department,
              :id
  
  def initialize(data)
    @name = data["name"]
    @city = data["city"]
    @state = data["state"]
    @avatar = "https://robohash.org/#{@name}" 
    @birthdate = data["birthdate"]
    @date_hired = data["date_hired"]
    @department = data["department"]
    @id = data["id"]
  end
end
