require 'rails/generators'

module ThesisCloudfront
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def code_that_runs
        create_file 'config/initilizers/asset_host.rb' do 
          heroku_app_name = ask("what's the name of the heroku app?")
          "ActionController::Base.asset_host = proc { |_, request|
            next unless request

            accepted_paths = %w[
                      /home-social
                      /take-the-quiz?var=vitamins-protein-explore
                      /take-the-quiz?var=explore
                    ]

            ENV['CLOUDFRONT_URL'] if accepted_paths.include?(request.fullpath)
          }"
        end
      end
    end
  end
end