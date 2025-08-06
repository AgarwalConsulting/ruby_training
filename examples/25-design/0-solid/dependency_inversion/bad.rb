class Notifier
  def notify(message)
    EmailService.new.send(message)
  end
end
