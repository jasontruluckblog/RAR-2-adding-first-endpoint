module Guide
  class Status < Grape::API
    namespace :status do
      desc "Returns the status of the API"
      get do
        { status: 'ok' }
      end
    end
  end
end
