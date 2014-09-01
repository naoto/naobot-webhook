class Pong < Naobot::Webhook::Base

  def on_privmsg(message)
    case message.body
    when /^ping/
      notice(message.to, 'pong')
    end
  end

end
