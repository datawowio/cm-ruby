# frozen_string_literal: true

module Datawow
  # :nodoc:
  class ImageClosedQuestion
    include Datawow::Models::Interface

    attr_writer :token

    def initialize
      @token = nil
      @type = :image
      @path = 'images/closed_questions'
    end
  end
end
