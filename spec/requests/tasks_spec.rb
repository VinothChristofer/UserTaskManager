require "spec_helper"

RSpec.describe "Tasks", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/tasks/index"
      expect(response).to have_http_status(:success)
    end
  end

end
