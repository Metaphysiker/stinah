require 'rails_helper'

RSpec.describe "HomeOffers", type: :request do
  describe "GET /home_offers" do
    it "works! (now write some real specs)" do
      get home_offers_path
      expect(response).to have_http_status(200)
    end
  end
end
