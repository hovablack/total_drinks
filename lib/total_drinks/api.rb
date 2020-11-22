class TotalDrinks::API

    def self.get_data
        response = RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=")
        cocktaildb = JSON.parse(response.body)["drinks"]
        cocktaildb.each do |cocktails|
            TotalDrinks::CocktailsDB.new(cocktails)
        end
    end
    
end