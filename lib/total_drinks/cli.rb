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
        end
    end

    def recommend
        # all = []
        rec = TotalDrinks::CocktailsDB.all.sample
        puts "#{rec.strDrink}".center(117).magenta.blink
        puts "#{rec.strInstructions}".center(117).blink
        # p rec.center(117)
        # binding.pry
        # rec.map do |itm|
        #     all.push(itm.strDrink)
        # end
        # puts all.sample.center(117).blue.on_red.blink
        mini_menu
    end
    
    def menu
        seperator
        puts "Cocktail Menu".center(117).black.on_white.blink
        # mini_menu
        separator_end
        drinks_list
        separator_end
        puts "Type your drink name for more details".center(117)
        input = gets.strip.downcase
        puts "Excellent choice!"
        menu_selection(input)
    end
    
    def menu_selection(water)
        @shots = TotalDrinks::CocktailsDB.find_by_name(water)
        @shots.each do |cho|
            seperator
            puts "#{cho.strDrink}".cyan.on_light_white.bold.center(132)
            seperator_mid
            puts "Drink ID: #{cho.idDrink}".center(117)
            seperator_mid
            puts "Drink Category: #{cho.strCategory}".center(117)
            seperator_mid
            puts "Instructions: #{cho.strInstructions}".center(117)
            separator_end
        end
        mini_menu
    end

    def drinks_list
        tcdb = TotalDrinks::CocktailsDB.all.each_with_index do |cocktail, idx|
            puts "#{idx + 1}. #{cocktail.strDrink}".center(58).blue.on_light_white.blink
        end
        tcdb
    end
    
    def mini_menu
        seperator
        puts "Please type your selection".center(117).yellow.on_white
        # puts " "
        puts "*     -Drink-                                        -Menu-                                         -Close-     *".center(117).white.on_black.blink.underline
        main
    end
    
    
    def wrong_choice
        puts "Oh no, we don't serve that, please make another selection.".red.blink
        main
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

