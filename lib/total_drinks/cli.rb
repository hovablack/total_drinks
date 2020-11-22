class TotalDrinks::CLI
    
    def call
        greeting
    end

    def greeting
        seperator
        puts "Welcome".center(117).colorize(:red)
        puts "To".center(117).colorize(:cyan)
        puts "The".center(117).colorize(:light_blue)
        puts "AWESOME BAR!".center(117, "***").colorize(:green).colorize( :background => :red)
        puts " "
        seperator
        puts "Please enter your name".center(117).colorize(:yellow)
        seperator
        @username = gets.chomp.capitalize
        addressed
    end

    def addressed
        seperator
        puts "Hi, #{@username}".center(117)
        puts "I'm AB, your waiter today".center(117)
        separator_to
        waiter
    end

    def seperator
        puts "-------------------------------".center(117)
        puts " "
    end

    def separator_to
        puts " "
        puts "-------------------------------".center(117)
    end

    def waiter
        puts "If you would like quick drink, enter 'Drink'".center(117)
        puts ""
        puts "If you would like to see our selection, enter 'Menu'".center(117)
        puts ""
        puts "If you want to leave the bar at anytime, enter 'close'".center(117)
        separator_to
        TotalDrinks::API.get_data
        puts "Please make a selection".center(117)
        main
    end

    def main
        input = gets.strip.downcase

        if input == "drink"
            menu
        elsif input == "menu"
            menu
        elsif input == "close"
            nothing_for_me
        else
            wrong_choice   
        end
    end

    def menu
        TotalDrinks::CocktailsDB.all.each_with_index do |cocktail, idx|
            puts "#{idx + 1}. #{cocktail.strDrink}"
        end
        puts ""
        puts ""
        puts "Please make a selection for more details"
        input = gets.strip.downcase
        puts "Excellent choice!"
        menu_selection(input)
    end

    def menu_selection(water)
        shots = TotalDrinks::CocktailsDB.find_by_name(water)
        shots.each do |cho|
            puts "Drink ID: #{cho.idDrink}"
            puts "Drink Category: #{cho.strCategory}"
            puts "Instructions: #{cho.strInstructions}"
        end
        main
    end

    def wrong_choice
        puts "Oh no, we don't serve that, please make another selection."
        main
    end

    def nothing_for_me
        puts "Please come back soon #{@username}."
    end
end

