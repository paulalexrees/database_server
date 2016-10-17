require 'rails_helper'

RSpec.describe ApplicationController do

  describe 'GET #set' do
    it "returns HTTP success" do
      get :set
      expect(response).to have_http_status(:success)
    end

    before do
      get :set, first_key: "first"
    end

    it "stores params[:first_key]'s value in session" do
      expect(session[:first_key]).to eq "first"
    end

    it "stores multiple keys across multiple requests" do
      get :set, second_key: "second"
      expect(session.keys).to include "first_key"
      expect(session.keys).to include "second_key"
    end

    it "overwrites the session's key value with another request" do
      get :set, first_key: "overwritten value"
      expect(session[:first_key]).to eq "overwritten value"
    end
  end


end
