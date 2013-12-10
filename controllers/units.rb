module Controllers
  module Units
      
    def self.registered(app)
      
      app.get '/units?/??:page/?' do
        if params[:page].nil?
          page = params[:page].to_i
        else
          page = 1
        end
        puts !params[:page].nil?
        response = {}
        response['units'] = Unit.all.page(page)
        if response['units'].length == 0
          halt 404, {'Content-Type' => 'application/javascript'}, '{error:  "no such page"}'
        end
        response['page'] = page
        response['pages'] = (Unit.count / 10)
        json response
      end
      
      app.get '/unit/:shortname' do |shortname|
        unit = Unit.includes(:events).where(shortname: shortname).first
        if unit.nil?
          halt 404, {'Content-Type' => 'application/javascript'}, '{error:  "no such unit"}'
        end
        json unit
      end
    end
  end
end