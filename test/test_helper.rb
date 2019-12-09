# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'simplecov'

SimpleCov.start

require 'posmoni'
require 'helper/file_reader'
require 'minitest/autorun'
require 'webmock/minitest'

class TestBase < Minitest::Test

  MODERATION_URL = 'https://api.posmoni.com/api/v1/moderations'

  def setup
    @moderation_all = FileReader.new('test/fixtures/moderation/all.json').read_json
    @moderation_create = FileReader.new('test/fixtures/moderation/create.json').read_json
    @moderation_find_by = FileReader.new('test/fixtures/moderation/find_by.json').read_json
    @options = {
      token: 'project token'
    }
  end
end
