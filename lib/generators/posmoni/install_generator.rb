require 'rails/generators/base'
require 'securerandom'

module Posmoni
  module Generators
    # :nodoc:
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      desc 'Creates a Posmoni initializer
       and copy locale files to your application.'

      def copy_initializer
        template 'posmoni_api.rb', 'config/initializers/posmoni_api.rb'
      end
    end
  end
end
