require 'pry'

class ShowFinder::API 

    ##Initializing from URL, API has 200 different web pages to pull from
    ##Initialize method chooses one page randomly to give more options
    def initialize 
        @url = "http://api.tvmaze.com/shows?page=#{rand(1...200)}"
    end

    #HTTParty used to parse data appropriately from API to create objects
    ##API does not have an limit that can be set so using range of indexes to access only 20 values
    ##Iterating through the show array to create individual show objects, shown here as the variable show_hash
    def get_show_data_create_objects
        puts "------------DATA HAS BEEN GRABBED SUCCESSFULLY------------".colorize(:light_green)
        show_array = HTTParty.get(@url)
        show_array[1...21].each do |show_hash|
            ShowFinder::Show.new(show_hash)
        end
    end
end
