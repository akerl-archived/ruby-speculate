##
# Base module for Speculate
module Speculate
  class << self
    ##
    # Insert a helper .new() method for creating a new Assumption object

    def new(*args)
      self::Assumption.new(*args)
    end
  end
end

require 'speculate/version'
require 'speculate/assumption'
