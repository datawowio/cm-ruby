require 'test_helper'

module Posmoni
  class PosmoniTest < Minitest::Test
    def test_setup
      Posmoni.setup { |config| }
    end

    def test_moderation
      moderation = Posmoni.moderation
      refute_nil(moderation)
    end
  end
end
