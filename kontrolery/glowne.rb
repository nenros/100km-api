module Sinatra
  module Kontrolery
    module Glowne

      def self.registered(app)

        app.get "/" do
          json :odpowiedz => "Hello world!"
        end

        app.get "/status" do
          json :status => "Ok"
        end

        app.get "/login" do

        end

        app.get "/logout" do

        end

        app.get "/auth" do

        end


      end
    end
  end
end