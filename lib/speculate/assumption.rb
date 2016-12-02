module Speculate
  ##
  # Base class for assumptions
  class Assumption
    def initialize(params = {})
      @options = params
    end

    private

    def client
      @client ||= Aws::STS::Client.new
    end
  end
end
