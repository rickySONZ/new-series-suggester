require 'colorize'

class ShowFinder::CLI 

def run
    introduction
    input = ""
    ShowFinder::API.new.get_show_data_create_objects
    list_shows
    check_input
end


def introduction
    puts "--------------------------------------------------------------------"
    puts "Hello you look like you have some free time on your hands..."
    puts "Might I suggest a new show?"
end
###This is where I would say yes shows the random list of 15 TV Shows
def list_shows

    @show_list = ShowFinder::Show.all.each.with_index(1) do |show, index|
        puts "#{index}. #{show.name}"
    end

    puts "-----------------------------------------------------------------------"
    puts "Would you like to see details about any of the shows on this list?".colorize(:yellow)
    puts "Please enter the number of the show you would like to know more about".colorize(:yellow)
    puts "If you would like to exit the program, please type Exit or End".colorize(:yellow)
    puts "-----------------------------------------------------------------------"
    
end

def check_input
    input = gets.strip
    puts "-----------------------------------------------------------------------"
    if input.to_i < 21 && input.to_i > 0 && input =~ /^\d+$/
        @show_list[input.to_i - 1].display
        puts "-----------------------------------------------------------------------"
        puts "If you would like to see another show, please put in the number (1-20)".colorize(:yellow)
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
        puts "-----------------------------------------------------------------------"
        check_input
    end

end




        
### From here there would be an indexed number of shows (would like to have it be the arrow that selects in the future)

### Choose any of the shows in order for you to see details about that specific show

####Show Details: #{index}. #{show.name}
### genres: summary: premiered:

### And then from there it would loop you back to that list of shows where you would be able to grab something and show the details again.

### Also would like to employ a function where you could display all of that info that could individually select by tapping alll

### Would be cool to be able to generate a new list of shows


##Issues that might have to be worked around below
### generating a list of only 15 objects from my API, I think a loop with a counter might work for that where it does pull all of the shows from that list, but it only saves continued
## 15 of them and then by using an @@all and .all method I can access that list and make a print method that would go ahead and print that list from the @@all array
### going to have to create some sort of play function with an end function that could be selected at various points when prompted
###CLI prompt going to need to respond to prompts from user selecting shows by index or name value at first and then trying to make it that arrow menu
###Can use gsub method to remove HTML from the summaries <p> <b>
###Genres are in an array, going to have to use join(", ") to make them present as wanted


end
