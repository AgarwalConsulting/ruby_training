class ObservableSubject
  def initialize
    @observers = []
  end

  def add_observer(obs)
    @observers << obs
  end

  def notify(data)
    @observers.each { |o| o.update(data) }
  end
end
