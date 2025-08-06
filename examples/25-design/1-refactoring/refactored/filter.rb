class ScoreFilter
  def initialize(threshold)
    @threshold = threshold
  end

  def filter(rows)
    rows.select { |row| row[2].to_i > @threshold }
  end
end
