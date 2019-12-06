# frozen_string_literal: true

require_relative 'cm/response'
require_relative 'cm/connector'
require_relative 'cm/error'
require_relative 'cm/version'
require_relative 'cm/interface'

require_relative 'cm/moderation'

# :nodoc:
module CM
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
