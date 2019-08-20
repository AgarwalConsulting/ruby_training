require 'pry'

class Post
  attr_accessor :status, :name

  DRAFT_STATUS = :draft
  PUBLISHED_STATUS = :published
  SPAM_STATUS = :spam
  STATUSES = [DRAFT_STATUS, PUBLISHED_STATUS, SPAM_STATUS]

  @all_posts = []

  class << self
    attr_accessor :all_posts

    STATUSES.each do |status|
      define_method("all_#{status.to_s}") do
        binding.pry if status == DRAFT_STATUS

        @all_posts.filter { |post| post.method("#{status.to_s}?").call }
      end
    end
  end

  def initialize
    @name = "Untitled Post"
    @status = DRAFT_STATUS

    self.class.all_posts << self
  end

  STATUSES.each do |status|
    # draft?, published?, spam?
    define_method("#{status.to_s}?") do
      @status == status
    end

    # draft!, published!, spam!
    define_method("#{status.to_s}!") do
      @status = status
    end
  end
end

binding.pry
