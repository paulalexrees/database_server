require 'rails_helper'

RSpec.describe ApplicationController do

  let(:cache) { Rails.cache }

  describe 'GET #set' do
    it "returns HTTP success" do
      get :set
      expect(response).to have_http_status(:success)
    end

    before do
      get :set, first_key: "first"
    end

    it "stores params[:first_key]'s value in cache" do
      expect(cache.fetch(:first_key)).to eq "first"
    end

    it "stores multiple keys across multiple requests" do
      get :set, second_key: "second"
      expect(cache.exist?(:first_key)).not_to be nil
      expect(cache.exist?(:second_key)).not_to be nil
    end

    it "overwrites the cache's key value with another request" do
      get :set, first_key: "overwritten value"
      expect(cache.fetch(:first_key)).to eq "overwritten value"
    end
  end

  describe 'GET #get' do
    it "returns HTTP success" do
      get :get
      expect(response).to have_http_status(:success)
    end

    it "returns a json" do
      get :set, first_key: "first"
      get :get, key: "first_key"
      expect(response.body).to eq "first"
    end


  end


end
