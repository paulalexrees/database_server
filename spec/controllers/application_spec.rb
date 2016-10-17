require 'rails_helper'

RSpec.describe ApplicationController do

  describe 'GET #set' do
    it "returns HTTP success" do
      get :set
      expect(response).to have_http_status(:success)
    end
  end


end
