class ShowFinder::Show 

    @@all = []

    def initialize(show_hash)
        show_hash

        @@all << self
    end

    def self.all
        @@all
    end



end