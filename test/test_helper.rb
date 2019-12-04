# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'simplecov'

SimpleCov.start

require 'helper/file_reader'
require 'cm'
require 'minitest/autorun'
require 'webmock/minitest'

class TestBase < Minitest::Test
  # attr_reader :options, :image_choice, :image_choices, :image_closed_question,
  #             :image_closed_questions, :image_message, :image_messages, :image_photo_tag,
  #             :image_photo_tags, :prediction, :predictions, :videos, :video,
  #             :text_categories, :text_category, :text_conversations, :text_conversation,
  #             :text_closed_questions, :text_closed_question, :nanameue_human, :nanameue_humans,
  #             :text_ja, :text_jas, :image_document_verifications, :image_document_verification

  MODERATION_URL = 'https://api.datawow.io/api/v1/moderations'

  def setup
    @moderation_all = FileReader.new('test/fixtures/moderation/all.json').read_json
    @moderation_create = FileReader.new('test/fixtures/moderation/create.json').read_json
    @moderation_find_by = FileReader.new('test/fixtures/moderation/find_by.json').read_json
    @options = {
      token: 'project token'
    }
  end
end
