require 'spec_helper'

describe 'Sprawdzenie glownych sciezek' do
  include Rack::Test::Methods

  def app
    Api.new
  end

  it "Czy hello world" do
    get '/'
    expect(last_response).to be_ok
    last_response.header['Content-Type'].should include 'application/javascript'
    expect(last_response.body).to eq('{"odpowiedz":"Hello world!"}')
  end

  it "Status" do
    get '/status'
    expect(last_response).to be_ok
    odpowiedz_json = JSON.parse(last_response.body.to_s)
    odpowiedz_json['status'] == "Ok"
  end

  it "Login" do

  end

  it "Logout" do

  end

  it "Auth" do

  end
end
