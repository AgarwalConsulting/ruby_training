class EmailService
  def send(message)
    puts "Sending email: #{message}"
  end
end

class Notifier
  def initialize(messenger)
    @messenger = messenger
  end

  def notify(message)
    @messenger.send(message)
  end
end

Notifier.new(EmailService.new).notify("Hello!")
