require 'pry'
class Artist
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select  do |song| 
            song.artist == self
        end
    end

    def add_song(song)
        song.artist = self
    end

    def add_song_by_name(song_name)
        Song.new(song_name).artist = self
    end

    def self.song_count
        total_song_count = 0
        self.all.select do |artist|
            total_song_count += artist.songs.count
        end
        total_song_count 
    end
end



#binding.pry