# frozen_string_literal: true

class Posmoni::Moderation
  include Posmoni::Interface

  attr_writer :project_key

  def initialize(token = nil)
    @project_key = token
    @type = :moderation
    @path = 'moderations'
  end
end
