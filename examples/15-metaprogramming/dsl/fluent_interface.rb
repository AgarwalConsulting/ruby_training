class Query
  def initialize
    @clauses = []
  end

  def where(condition)
    @clauses << "WHERE #{condition}"
    self
  end

  def order(field)
    @clauses << "ORDER BY #{field}"
    self
  end

  def limit(n)
    @clauses << "LIMIT #{n}"
    self
  end

  def to_sql
    "SELECT * FROM table " + @clauses.join(" ")
  end
end

sql = Query.new.where("age > 30").order("name").limit(10).to_sql
puts sql
# => SELECT * FROM table WHERE age > 30 ORDER BY name LIMIT 10
