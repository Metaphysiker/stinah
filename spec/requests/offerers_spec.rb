require 'rails_helper'

RSpec.describe "Offerers", type: :request do
  describe "GET /offerers" do
    it "works! (now write some real specs)" do
      get offerers_path
      expect(response).to have_http_status(200)
    end
  end
end
