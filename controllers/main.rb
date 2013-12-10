  module Controllers
    module Main

      def self.registered(app)

        app.get "/" do
          response = {:units=>Unit.count, :km=>Event.sum(:km)}
          json response        
        end

        app.get "/status" do
          json :status => "Ok"
        end

        app.post "/login" do
          user = User.find_by(email: params['email']).try(:authenticate, params['password'])
          if user == nil
            halt 401, {'Content-Type' => 'application/javascript'}, '{error:  "bad user"}'
          elsif user == false
            halt 401, {'Content-Type' => 'application/javascript'}, '{error:  "bad password"}'            
          end
          session[:user_id] = user.id
          if !user.unit.nil?
            session[:unit_id] = user.unit.id
          end
          if !user.admin == true
            session[:admin] = true
          end
          redirect '/auth'
          
        end

        app.get "/logout" do
          session.clear
        end

        app.get "/auth" do
          json session[:user_id]

        end


      end
    end
  end
