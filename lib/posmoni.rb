# frozen_string_literal: true

require_relative 'posmoni/response'
require_relative 'posmoni/connector'
require_relative 'posmoni/error'
require_relative 'posmoni/version'
require_relative 'posmoni/interface'

require_relative 'posmoni/moderation'

# :nodoc:
module Posmoni
  extend self

  attr_accessor :project_key

  class << self
    def setup
      yield self
    end

    def moderation
      Moderation.new
    end
  end
end
