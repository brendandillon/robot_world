class RobotWorldApp < Sinatra::Base

  get '/' do
    @statistics = statistics_manager
    erb :dashboard
  end

  get '/robots' do
    @robots = robot_manager.all
    erb :index
  end

  get '/robots/new' do
    erb :new
  end

  post '/robots' do
    robot_manager.create(params[:robot])
    redirect '/robots'
  end

  get '/robots/:id' do |id|
    @robot = robot_manager.find(id.to_i)
    erb :show
  end
  
  get '/robots/:id/edit' do |id|
    @robot = robot_manager.find(id.to_i)
    erb :edit
  end

  put '/robots/:id' do |id|
    robot_manager.update(id.to_i, params[:robot])
    redirect "/robots/#{id}"
  end

  delete '/robots/:id' do |id|
    robot_manager.delete(id.to_i)
    redirect '/robots'
  end

  def database
    if ENV['RACK_ENV'] == "test"
      db = SQLite3::Database.new("db/robot_manager_test.db")
    else
      db = SQLite3::Database.new("db/robot_manager_development.db")
    end
    db.results_as_hash = true
    db
  end

  def statistics_manager
    @statistics_manager ||= StatisticsManager.new(database)
  end

  def robot_manager
    @robot_manager ||= RobotManager.new(database)
  end
end
