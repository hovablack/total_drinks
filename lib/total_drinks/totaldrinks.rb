class TotalDrinks::CocktailsDB

    attr_accessor :idDrink, :strDrink, :strCategory, :strInstructions

    @@all = []


    def initialize(hash)
        hash.each do |k, v|
            self.send(("#{k}="), v) if self.respond_to?(("#{k}="))
        end
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_name(drink)
        self.all.find do |cocktail|
            cocktail.strDrink.downcase == drink
        end
    end
    
end