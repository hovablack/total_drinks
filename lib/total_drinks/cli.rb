class TotalDrinks::CLI
    
    def call
        greeting
    end

    def greeting
        seperator
        puts "Welcome".center(117).colorize(:red)
        puts "To".center(117).colorize(:cyan)
        puts "The".center(117).colorize(:light_blue)
        puts "AWESOME BAR!".center(117, "***").colorize(:green).colorize( :background => :red).bold
        puts " "
        seperator
        puts "Please enter your name".center(117).colorize(:yellow)
        seperator
        @username = gets.chomp.capitalize
        addressed
    end
    
    def addressed
        seperator
        puts "Hi, #{@username}".center(117).cyan.on_blue.bold
        puts "I'm AB, your waiter today".center(117).cyan.on_blue.bold
        seperator
        sleep(1.5)
        waiter
        separator_end
        TotalDrinks::API.get_data
        mini_menu
    end
    
    
    def waiter
        puts "If you would like quick drink, type 'Drink'".center(117)
        puts ""
        puts "If you would like to see our selection, type 'Menu'".center(117)
        puts ""
        puts "If you want to leave the bar at anytime, type 'Close'".center(117)
    end
    
    def main
        input = gets.strip.downcase
    
        if input == "drink"
            recommend
        elsif input == "menu"
            menu
        elsif input == "main"
            waiter
        elsif input == "close"
            nothing_for_me
        else
            wrong_choice
            sleep(1)
            mini_menu
        end
    end

    def recommend
        puts "Here is your drink, #{@username}".center(58).light_blue
        rec = TotalDrinks::CocktailsDB.all.sample
        puts "#{rec.strDrink}".center(117).magenta
        seperator_mid
        puts "#{rec.strInstructions}".center(117)
        mini_menu
    end
    
    def menu
        seperator
        puts "Cocktail Menu".center(117).black.on_white.bold
        separator_end
        drinks_list
        separator_end
        puts "Type your drink name for more details".center(117)
        input = gets.strip.downcase
        menu_selection(input)
    end
    
    def menu_selection(drink)
        shots = TotalDrinks::CocktailsDB.find_by_name(drink) || (drink.to_i != 0 && TotalDrinks::CocktailsDB.all[drink.to_i - 1])
        if shots
            puts "Excellent choice!".center(58).green.on_light_white
            drink_details(shots)
        elsif drink == "close"
            nothing_for_me
        else
            wrong_choice
            sleep(1)
            menu
        end
    end


    def drink_details(cocktails)
        seperator
        puts "#{cocktails.strDrink}".cyan.on_light_white.bold.center(132)
        seperator_mid
        puts "Drink ID: #{cocktails.idDrink}".center(117)
        seperator_mid
        puts "Drink Category: #{cocktails.strCategory}".center(117)
        seperator_mid
        puts "Instructions: #{cocktails.strInstructions}".center(117)
        separator_end
        mini_menu
    end

    def drinks_list
        TotalDrinks::CocktailsDB.all.each_with_index do |cocktail, idx|
            puts "#{idx + 1}. #{cocktail.strDrink}".center(58).blue.on_light_white
        end
    end
    
    def mini_menu
        seperator
        puts "Please type your selection".center(117).yellow.on_white
        puts "*     -Drink-                                        -Menu-                                         -Close-     *".center(117).white.on_black.blink.underline
        main
    end
    
    def wrong_choice
        puts "Oh no, we don't serve that, please make another selection.".red.blink
    end
    
    def nothing_for_me
        puts "Please come back soon #{@username}.".colorize(:color => :blue, :background => :red)
    end

    def seperator
        puts "-------------------------------".center(117)
        puts " "
    end
    
    def separator_end
        puts " "
        puts "-------------------------------".center(117)
    end

    def seperator_mid
        puts "-------------------------------".center(117).magenta
        puts " "
    end

end

