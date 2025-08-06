require_relative './refactored/reader'
require_relative './refactored/parser'
require_relative './refactored/filter'
require_relative './refactored/reporter'

class Application
  def initialize(path, threshold)
    @reader = FileReader.new(path)
    @parser = CSVParser.new
    @filter = ScoreFilter.new(threshold)
    @reporter = Reporter.new
  end

  def run
    raw = @reader.read
    rows = @parser.parse(raw)
    high_scores = @filter.filter(rows)
    @reporter.report(high_scores)
  end
end

Application.new('data.csv', 100).run
