# frozen_string_literal: true

class CM::Moderation
  include CM::Interface

  attr_writer :project_key

  def initialize(token = nil)
    @project_key = token
    @type = :moderation
    @path = 'moderations'
  end
end
