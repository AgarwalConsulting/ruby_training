require_relative './01-define-method'

# https://github.com/rails/rails/blob/04cfbc807f0567af5a27e8ba45eab52f7b9e6618/activerecord/lib/active_record/dynamic_matchers.rb#L15

class Post
  class << self
    def method_missing(method_name, *arguments, &block)
      if method_name.to_s =~ /find_by_(.*)/
        @all_posts.filter { |post| post.send($1) == arguments.first }
      else
        super
      end
    end

    def respond_to?(method_name, include_private = false)
      method_name.to_s.start_with?('find_by') || super
    end
  end
end
