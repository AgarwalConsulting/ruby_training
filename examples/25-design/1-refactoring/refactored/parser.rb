class CSVParser
  def parse(raw_data)
    raw_data.split("\n").map { |line| line.split(",") }
  end
end
