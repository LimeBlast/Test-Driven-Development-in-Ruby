class Competition
  attr_accessor :questions

  class Closed < StandardError
  end
end