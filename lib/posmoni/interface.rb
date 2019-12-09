# frozen_string_literal: true

module Posmoni::Interface
  def all(options = {})
    connector.get(options)
  end

  def create(options)
    connector.post(options)
  end

  def find_by(options = {})
    @query_str = true if @query_str.nil?
    connector.get(options.merge({ query: options[:id] }), @query_str)
  end

  private

  def connector
    @connection ||= Posmoni::Connector.new(@path, @type, token: @project_key)
  end
end
