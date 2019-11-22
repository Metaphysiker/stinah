require 'rails_helper'

RSpec.describe "ChickenAdoptions", type: :request do
  describe "GET /chicken_adoptions" do
    it "works! (now write some real specs)" do
      get chicken_adoptions_path
      expect(response).to have_http_status(200)
    end
  end
end
