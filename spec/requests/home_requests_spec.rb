require 'rails_helper'

RSpec.describe "HomeRequests", type: :request do
  describe "GET /home_requests" do
    it "works! (now write some real specs)" do
      get home_requests_path
      expect(response).to have_http_status(200)
    end
  end
end
