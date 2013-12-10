
  module Controllers
    module Districts

      def self.registered(app)

        app.get "/districts" do
          districts = District.all
          json districts
        end

        app.get "/district/:id" do |id|
          district = District.find(id)
          json district
        end

      end

    end
  end
