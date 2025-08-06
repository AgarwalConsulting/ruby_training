class ObservableSubject
  def initialize
    @observers = []
  end

  def add_observer(obs)
    @observers << obs
  end

  def update(data)
    @observers.each { |o| o.notify(data) }
  end
end
