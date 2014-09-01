module Naobot
  module Webhook
    class Server < Sinatra::Base

      set :server, :webrick

      configure do
        @@plugin = Plugin.new("./plugins/")
      end

      post '/receive' do
        response = []
        @@plugin.receive(params[:channel], params[:user], params[:message]) do |res|
          response << res
        end
        response.to_json
      end

    end
  end
end
