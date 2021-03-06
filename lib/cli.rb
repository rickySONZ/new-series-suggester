require 'colorize'

class ShowFinder::CLI 

## This is the flow of the CLI that calls the methods in correct order
    def run
        introduction
        input = ""
        ShowFinder::API.new.get_show_data_create_objects
        list_shows
        check_input
    end

## This is the standard intro of the CLI
    def introduction
        puts "--------------------------------------------------------------------"
        puts "Hello you look like you have some free time on your hands..."
        puts "Might I suggest a new show?"
    end


###This is where the CLI shows the random list of 15 TV Shows
    def list_shows

        show_list = ShowFinder::Show.all.each.with_index(1) do |show, index|
            puts "#{index}. #{show.name}"
        end

        puts "-----------------------------------------------------------------------"
        puts "Would you like to see details about any of the shows on this list?".colorize(:yellow)
        puts "Please enter the number of the show you would like to know more about".colorize(:yellow)
        puts "If you would like to exit the program, please type Exit or End".colorize(:yellow)
        puts "-----------------------------------------------------------------------"
    end

### This method searches through the indexes of the @@all array of shows
### and displays info for selected show using interpolation
    def display_info(input)
        newshow = ShowFinder::Show.all[input.to_i - 1]
        puts "Name: #{newshow.name}"
        puts "Genres: #{newshow.genre}"
        puts "Language: #{newshow.language}"
        puts "Network: #{newshow.network}"
        puts "Country: #{newshow.country}"
        puts "Premiered On: #{newshow.premiered}"
        puts "Status: #{newshow.status}"
        puts "Run Time: #{newshow.run_time} minutes"
        puts "Official Website: #{newshow.official_site}"
        puts "Summary: #{newshow.summary.gsub("<p>", "").gsub("</p>", "").gsub("<b>", "").gsub("</b>", "").gsub("<i>", "").gsub("</i>", "")}" if newshow.summary != nil
    end


# This validates user input and makes decisions based upon them
# If user input is an integer that is between 1-20 it will be accepted and show program details, a method defined in the show class
# The user is then looped back into the check input method of the CLI
# If the user input is list, the list of shows is displayed again
# If the user input is end or exit, the program is ended
# If the user input is anything else, it will prompt the user to use a valid input
    def check_input
        input = gets.strip
        puts "-----------------------------------------------------------------------"
        if input.to_i < 21 && input.to_i > 0 && input =~ /^\d+$/
            display_info(input)
            puts "-----------------------------------------------------------------------"
            puts "If you would like to see another show, please put in a number (1-20)".colorize(:yellow)
            puts "-----------------------------------------------------------------------"
            check_input
        elsif input.downcase == "list"
            list_shows
            check_input
        elsif input.downcase == "exit" || input.downcase =="end"
            puts "Thank you for using the New Series Suggester."
            puts "Goodbye!"
            puts "-----------------------------------------------------------------------"
        else
            puts "I'm sorry but that is not a correct input".colorize(:light_red)
            puts "Only numbers 1 - 20, list, exit, or end are valid inputs".colorize(:light_red)
            puts "-----------------------------------------------------------------------"
            check_input
        end
    end
end
