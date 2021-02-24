class ShowFinder::Show 

    @@all = []

    attr_reader :name, :run_time, :genre, :summary, :language, :network, :official_site, :premiered, :status, :country

    

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

    def save
        @@all << self
    end 

    def self.all
        @@all
    end

    def display
        puts "Name: #{self.name}"
        puts "Genres: #{self.genre}"
        puts "Language: #{self.language}" 
        puts "Network: #{self.network}"
        puts "Country: #{self.country}"
        puts "Premiered On: #{self.premiered}"
        puts "Status: #{self.status}"
        puts "Run Time: #{self.run_time} minutes"
        puts "Official Website: #{self.official_site}"
        puts "Summary: #{self.summary.gsub("<p>", "").gsub("</p>", "").gsub("<b>", "").gsub("</b>", "").gsub("<i>", "").gsub("</i>", "")}" if self.summary != nil
    end

end
