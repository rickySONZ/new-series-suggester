class ShowFinder::Show 

    @@all = []

    ## Objects only given reader, not editing values
    attr_reader :name, :run_time, :genre, :summary, :language, :network, :official_site, :premiered, :status, :country

    ## Shows initialize by pulling from hash keys from API
    ## Dig method used to access multiple levels of API easily
    def initialize(show_hash)
            @name = show_hash["name"]
            @genre = show_hash["genres"].join(" ")
            @summary = show_hash["summary"]
            @run_time = show_hash["runtime"]
            @language = show_hash["language"]
            @network = show_hash.dig("network", "name")
            @official_site = show_hash["officialSite"]
            @premiered = show_hash["premiered"]
            @status = show_hash["status"]
            @country = show_hash.dig("network", "country", "name")
            save
    end

    ##Method used to store instances of shows in @@all array
    def save
        @@all << self
    end 

    ## Reader for @@all
    def self.all
        @@all
    end

end
