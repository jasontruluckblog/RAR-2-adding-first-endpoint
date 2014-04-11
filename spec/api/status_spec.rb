require "spec_helper"

describe Guide::Status do
  describe "GET /status" do
    it "returns OK" do
      get "/status", {}, {}

      expect(last_response.status).to eq(200)
      expect(last_response.body).to be_json_eql({ 'status' => 'ok' }.to_json)
    end
  end
end
