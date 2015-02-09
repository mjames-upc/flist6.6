require 'rails_helper'

RSpec.describe "FrankenBeers", type: :request do
  describe "GET /franken_beers" do
    it "works! (now write some real specs)" do
      get franken_beers_path
      expect(response).to have_http_status(200)
    end
  end
end
