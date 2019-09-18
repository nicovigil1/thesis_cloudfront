require 'rails/generators'

module ThesisCloudfront
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def code_that_runs
        insert_into_file "Gemfile", after: "group :development, :test do\n" do
          "  gem 'rack_cors'\n"
        end

        system('bundle')

        create_file "config/initializers/rack_cors.rb" do
            ["Rails.application.config.middleware.insert_before 0, Rack::Cors do",
            "  allow do",
            "    origins [",
            "      /https:\/\/careoflander.herokuapp.com/,",
            "      /http:\/\/careoflander.herokuapp.com/,",
            "      /https:\/\/careoflander-pr-[0-9]+.herokuapp.com/,",
            "      /http:\/\/careoflander-pr-[0-9]+.herokuapp.com/",
            "            ]",
            "  resource '/assets/*', headers: :any, methods: [:get, :head, :options]",
            "end"].join('\n')
        end
      end
    end
  end
end