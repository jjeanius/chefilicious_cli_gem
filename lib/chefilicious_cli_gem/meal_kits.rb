class ChefiliciousCliGem::Meal_Kits
  attr_accessor :name, :price, :skill_level, :cooking_time, :allergen, :url

  def self.selection
    puts "listing meal_kits"
    # return a bunch of instances meal_kits
    #@meal_kits = ChefiliciousCliGem::meal_kit.selection

    meal_kit_1 = self.new
    meal_kit_1.name = "Chef'D"
    meal_kit_1.price = "price_meal_kit_1"
    meal_kit_1.skill_level = "easy, intermedian, hard"
    meal_kit_1.cooking_time = "minutes"
    meal_kit_1.allergen = "allergen"
    meal_kit_1.url = "https://www.chefd.com/collections/top-rated"

    meal_kit_2 = self.new
    meal_kit_2.name = "Fresh_Direct"
    meal_kit_2.price = "price_meal_kit_2"
    meal_kit_2.skill_level = "easy, intermedian, hard"
    meal_kit_2.cooking_time = "minutes"
    meal_kit_2.allergen = "allergen"
    meal_kit_2.url = "https://www.freshdirect.com/browse.jsp?pageType=browse&id=meals_kits_meals"

    meal_kit_3 = self.new
    meal_kit_3.name = "Chefday!"
    meal_kit_3.price = "price_meal_kit_3"
    meal_kit_3.skill_level = "easy, intermedian, hard"
    meal_kit_3.cooking_time = "minutes"
    meal_kit_3.allergen = "allergen"
    meal_kit_3.url = "http://www.chefday.com/recipes"
  end

end
