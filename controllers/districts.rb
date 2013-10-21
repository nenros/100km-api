module Sinatra
  module Controllers
    module Districts

      def self.registered(app)

        app.get "/districts" do
          districts = District.all
          json districts
        end

        app.get "/district/:id" do |id|
          districts = District.find(id)
          json districts
        end

      end

    end
  end
end