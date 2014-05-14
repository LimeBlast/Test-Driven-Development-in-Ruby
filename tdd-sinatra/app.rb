require 'sinatra'
require 'haml'
require 'pstore'
require_relative '../tdd-ruby/lib/team'
require_relative '../tdd-ruby/lib/competition'

class App < Sinatra::Base

  before { load_db }

  get '/' do
    'Hello World'
  end

  get '/teams/new' do
    haml :'teams/new'
  end

  post '/teams' do
    @team = Team.new params[:name]
    save_team @team

    redirect '/teams/success'
  end

  get '/teams/success' do
    @db.transaction { @team = @db[:team] }
    haml :'teams/success'
  end

  private

  def load_db
    @db = PStore.new 'store'

    @db.transaction do
      @db[:competitions] ||= [
          Competition.new,
          Competition.new(['Question 1'])
      ]
    end
  end
end