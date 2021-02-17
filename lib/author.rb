require 'pry'
class Author
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def posts
        Post.all.select  do |post| 
            post.author == self
        end
    end

    def add_post(post)
        post.author = self
    end

    def add_post_by_title(post_name)
        Post.new(post_name).author = self
    end

    def self.post_count
        total_post_count = 0
        self.all.select do |author|
            total_post_count += author.posts.count
        end
        total_post_count 
    end
end