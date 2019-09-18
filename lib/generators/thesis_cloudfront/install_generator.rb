require 'rails/generators'

module ThesisCloudfront
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def code_that_runs
        insert_into_file "Gemfile", after: "group :development, :test do\n" do
          "gem 'rack_cors'"
        end
      end
    end
  end
end