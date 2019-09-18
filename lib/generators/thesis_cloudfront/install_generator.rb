require 'rails/generators'

module ThesisCloudfront
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def install
        append_to_file "Gemfile" do
          "\ngem 'rack_cors'"
        end

        heroku_app_name = ask("whats the name of this heroku app?")

        create_file "config/initializers/rack_cors.rb" do
            ["Rails.application.config.middleware.insert_before 0, Rack::Cors do",
            "  allow do",
            "      origins [",
            "        /https:\\/\\/#{heroku_app_name}.herokuapp.com/,",
            "        /http:\\/\\/#{heroku_app_name}.herokuapp.com/,",
            "        /https:\\/\\/#{heroku_app_name}-pr-[0-9]+.herokuapp.com/,",
            "        /http:\\/\\/#{heroku_app_name}-pr-[0-9]+.herokuapp.com/",
            "      ]",
            "    resource '/assets/*', headers: :any, methods: [:get, :head, :options]",
            "  end",
            "end"].join("\n")
        end

        create_file "config/initializers/asset_host.rb" do
          "ActionController::Base.asset_host = ENV['CLOUDFRONT_URL']"
        end
      end
    end
  end
end