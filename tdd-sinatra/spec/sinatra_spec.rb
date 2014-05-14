$:.unshift(File.dirname(__FILE__) + '../../')

require 'sinatra'
require 'app'
require 'rack/test'

set :environment, :test

describe App do
  include Rack::Test::Methods
  def app
    App
  end

  describe 'First tests with Sinatra' do
    it 'says hello world' do
      get '/'

      last_response.status.should == 200
      last_response.body.should =~ /Hello World/
    end
  end

  describe 'Teams' do
    it 'allows to create teams' do
      get '/teams/new'

      last_response.body.should =~ /<h1>New team<\/h1>/
    end

    it 'creates teams' do
      post '/teams', { name: 'Random' }
      follow_redirect!

      last_response.body.should =~ /Created team "Random"/
    end
  end

  describe 'a competition' do
    context 'with no questions' do
      let(:params) { }

      it "won't allow teams to enter"
    end

    context 'with questions' do
      let(:params) { }

      it "won't allow teams to enter"
    end
  end
end