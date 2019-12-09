require 'rails/generators'
require 'csv'

module Cloudfront
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def install
        # append_to_file "Gemfile" do
        #   "\ngem 'rack-cors'"
        # end

        heroku_app_name = ask("whats the name of this heroku app?")
        file = `heroku domains -a #{heroku_app_name} --csv`
        file&.gsub!(/===.+|.+\.herokuapp.com/, '').strip
        domains = []
        if file.class == Array
          CSV.parse(file, headers: true).each do |x|
            if x['Domain Name']
              domains << '      /https:\/\/' + "#{x['Domain Name']}/"
              domains << '      /http:\/\/' + "#{x['Domain Name']}/"
            end
          end
        end

        create_file "config/initializers/rack_cors.rb" do
            ["Rails.application.config.middleware.insert_before 0, Rack::Cors do",
            "  allow do",
            "    origins [",
            "      /https:\\/\\/#{heroku_app_name}.herokuapp.com/,",
            "      /http:\\/\\/#{heroku_app_name}.herokuapp.com/,",
            "      /https:\\/\\/#{heroku_app_name}-pr-\w+.herokuapp.com/,",
            "      /http:\\/\\/#{heroku_app_name}-pr-\w+.herokuapp.com/,", domains.join(",\n"),
            "    ]",
            "    resource '/assets/*', headers: :any, methods: [:get, :head, :options]",
            "  end",
            "end"].join("\n")
        end

        create_file "config/initializers/cloudfront.rb" do
          ["ActionController::Base.asset_host = ENV['CLOUDFRONT_URL']", 
           "config.public_file_server.headers = {",
           "    'Cache-Control' => 'public, max-age=2592000',",
           "    \"Expires\" => \"\#{30.days.from_now.to_formatted_s(:rfc822)}\"",
           "  }"].join("\n")
        end
      end
    end
  end
end