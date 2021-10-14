class Artist
    extend Concerns::Findable

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
    end

    def self.all
        @@all
    end

    def self.destroy_all
        all.clear
    end

    def save
        self.class.all << self
        self
    end


    def self.create(name)
        new(name).save
    end

    def songs
        @song = Song.all.select do |song|
            song.artist == self
        end
    end

    def add_song(song)
        # binding.pry
        song.artist = self unless song.artist
    end

    def genres
        songs.collect { |s| s.genre }.uniq
    end

    def self.find_or_create_by_name(name)
        find_by_name(name) || create(name)
    end

end