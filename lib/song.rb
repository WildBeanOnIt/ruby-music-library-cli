class Song

    attr_accessor :name
    attr_reader :artist, :genre

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def name=(name)
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

end