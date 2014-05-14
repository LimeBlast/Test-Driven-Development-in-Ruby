require 'cucumber/rspec/doubles'
require_relative '../../lib/team'
require_relative '../../lib/competition'

Given /there is a team called "([^"]*)"/ do |name|
  @team = Team.new name
end

Given /I have a competition with( no)? questions/ do |no_questions|
  @competition = Competition.new
  if no_questions
    @competition.stub questions: []
  else
    @competition.stub questions: [ stub ]
  end
end

When /a team enters a competition/ do
  @method = -> { @team.enter_competition @competition }
end

Then /I should( not)? see an error/ do |dont_raise|
  if dont_raise
    @method.should_not raise_error Competition::Closed
  else
    @method.should raise_error Competition::Closed
  end
end