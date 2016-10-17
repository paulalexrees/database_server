require 'rails_helper'

RSpec.describe ApplicationController do

  describe 'GET #set' do
    it "returns HTTP success" do
      get :set
      expect(response).to have_http_status(:success)
    end

    it "stores params[:somekey]'s value in session" do
      get :set, somekey: "hello"
      expect(session[:somekey]).to eq "hello"
    end

    it "overwrites the session's somekey value with another request" do
      get :set, somekey: "hello"
      expect(session[:somekey]).to eq "hello"
      get :set, somekey: "overwritten value"
      expect(session[:somekey]).to eq "overwritten value"
    end
  end


end
