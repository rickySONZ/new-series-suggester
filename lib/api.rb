require 'pry'
require 'colorize'

class ShowFinder::API 

    

    def initialize 
        @url = "http://api.tvmaze.com/shows?page=214"
    end

    def get_show_data_create_objects
        puts "------------DATA HAS BEEN GRABBED SUCCESSFULLY------------".colorize(:light_green)
        show_array = HTTParty.get(@url)
        show_array[1...21].each do |show_hash|
            ShowFinder::Show.new(show_hash)
        end
    end
end
