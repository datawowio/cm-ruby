require 'rails/generators/base'
require 'securerandom'

module Cm
  module Generators
    # :nodoc:
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      desc 'Creates a CM initializer
       and copy locale files to your application.'

      def copy_initializer
        template 'cm_api.rb', 'config/initializers/cm_api.rb'
      end
    end
  end
end
