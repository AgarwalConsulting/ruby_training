class Reporter
  def report(rows)
    rows.each do |row|
      puts "#{row[0]} has score #{row[2]}"
    end
  end
end
