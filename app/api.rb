module Guide
  class API < Grape::API
    # Format the API will respond to
    format :json

    # Mount Public API endpoints
    mount Guide::Status

    # Catch-all for any route not specified
    # This MUST remain at the bottom of the file
    # or your gonna have a bad time...
    route :any, "*path" do
      error!("404 Not Found", 404)
    end
  end
end
