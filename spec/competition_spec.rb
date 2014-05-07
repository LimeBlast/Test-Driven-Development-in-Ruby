require_relative '../lib/competition'
require_relative '../lib/team'
require_relative 'support/matchers/team_support'

describe Competition do
  let(:competition) { Competition.new }
  let(:team) { Team.new('Random Name') }

  context 'having no questions' do
    before { competition.questions = [] }

    it "it doesn't accept any teams" do
      competition.should_not allow_teams_to_enter
    end
  end

  context 'having questions' do
    before { competition.questions = [{:title => 'Question'}] }
    subject { competition }

    it { should allow_teams_to_enter }
  end

end