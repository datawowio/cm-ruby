require 'test_helper'

module CM
  class CMTest < Minitest::Test
    def test_setup
      CM.setup { |config| }
    end

    def test_moderation
      moderation = CM.moderation
      refute_nil(moderation)
    end
  end
end
