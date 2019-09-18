require 'rails/generators'

module ThesisCloudfront
  module Generators
    class InstallGenerator < Rails::Generators::NamedBase
      def install
        insert_into_file "Gemfile", after: "group :development, :test do\n" do
          "  gem 'rack_cors'\n"
        end


        create_file "config/initializers/rack_cors.rb" do
            heroku_app_name = ask("whats the name of this heroku app?")
            ["Rails.application.config.middleware.insert_before 0, Rack::Cors do",
            "  allow do",
            "    origins [",
            "      /https:\/\/#{heroku_app_name}.herokuapp.com/,",
            "      /http:\/\/#{heroku_app_name}.herokuapp.com/,",
            "      /https:\/\/#{heroku_app_name}-pr-[0-9]+.herokuapp.com/,",
            "      /http:\/\/#{heroku_app_name}-pr-[0-9]+.herokuapp.com/",
            "            ]",
            "  resource '/assets/*', headers: :any, methods: [:get, :head, :options]",
            "end"]
        end
      end
    end
  end
end