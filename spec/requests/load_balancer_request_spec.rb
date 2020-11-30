require 'rails_helper'
require "faker"

RSpec.describe "LoadBalancers", type: :request do

  describe "GET /process" do
    it "returns http success" do
      get "/process"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /process" do
    it "returns http bad request" do
      post "/process"
      expect(response).to have_http_status(:bad_request)
    end

    it "returns http created" do
      post "/process", params: { "ip": "192.168.10.11" }
      expect(response).to have_http_status(:created)
    end

    it "returns http bad request" do
      post "/process", params: { "ip": "192.168.10.11" }
      expect(response.body).to include("IP already exists")
    end

    it "returns http bad request" do 
      10.times do 
        ip = Faker::Internet.ip_v4_address
        post "/process", params: { "ip": ip }
      end
      post "/process", params: { "ip": "192.168.10.12"}
      expect(response.body).to include("IP register full")
    end
  end



  


end
