require 'pry'

class ShowFinder::API 

    

    def initialize 
        @url = "http://api.tvmaze.com/shows?page=#{rand(1...100)}"
    end

    def get_show_data
        show_array = HTTParty.get(@url)
        show_array = show_array.to_a
        self.create_show_objects(show_array)
    end

    def create_show_objects(show_array)
        show_array.each do |show_hash|
            ShowFinder::Show.new(show_hash)
        end
        binding.pry
    end
    




end
