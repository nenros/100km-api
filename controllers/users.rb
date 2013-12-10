  module Controllers
    module Users
      
      def self.registered(app)
        
        app.post '/user' do
          begin
            user = User.new
            user.from_json(params['user'].to_json)                  
            unit = Unit.new
            unit.from_json(params['unit'].to_json)
          rescue ActiveRecord::UnknownAttributeError => e
            halt 406, json(:errors=>"Unknown Attribute #{e}")
          end
          district = District.find(params['district_id'])

          if (user.invalid? || unit.invalid?)
            errors = {}
            if user.errors
              errors.merge!(:user => user.errors.to_hash)
              
            end
            if unit.errors
              errors.merge!(:unit => unit.errors.to_hash)
              
            end
            halt 409, json(:errors=>errors)
          else
            unit.district = district
            user.unit = unit
            user.save
          end

        end
        
      end
    end
  end