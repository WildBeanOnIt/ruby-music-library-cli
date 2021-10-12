class Artist

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all = []
    end

    def self.all
        @@all
    end

    def self.destroy_all
        all.clear
    end

    def save
        self.class.all << self
    end


    def self.create(name)
        new(name).save
    end













end