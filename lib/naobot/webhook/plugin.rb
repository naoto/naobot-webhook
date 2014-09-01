module Naobot::Webhook
  class Plugin

    def initialize(path)
      @plugins = Hash.new([])
      Dir.glob("./plugins/*.rb").each do |plugin|
        require plugin
        name = Rinne::camelize(File.basename(plugin,'.*'))
        @plugins[name] = Naobot::Webhook.const_get(name).new
      end
    end

    def receive(channel, user, text)
      message = Message.new(channel, user, text)
      @plugins.each do |neme, cls|
        cls.on_privmsg(message)
        cls.result(message.to).each do |res|
          yield res
        end
      end
    end

  end
end
