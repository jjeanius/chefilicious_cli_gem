class ChefiliciousCliGem::Meal_Kits
  attr_accessor :name, :price, :skill_level, :cooking_time, :allergen, :url, :meal_kits

  def self.scrape_meal_kits
    meal_kits = []
    # Go to Chef'D, Chefday, Fresh_Direct find the information
    # extract the properties
    # instantiate meal_kit

    #meal_kits << self.scrape_chef_d
    #meal_kits << self.scrape_chefday
    #meal_kits << self.scrape_fresh_direct

  meal_kits
  self.scrape_chef_d.css
  self.scrape_fresh_direct.css
  self.scrape_chefday.css
end

  def self.scrape_chef_d
    doc = Nokogiri::HTML(open("https://www.chefd.com/collections/all?sort_by=best-selling"))
    meal_kits_chef_d = doc.css("div.grid.grid--uniform.grid--view-items.product-list")
    binding.pry
    chef_d = []
    meal_kits_chef_d.each do|mealkit_chef_d|
      mealkit_chef_d.name =
      mealkit_chef_d.price =
      mealkit_chef_d.skill_level =
      mealkit_chef_d.meal_type =
      mealkit_chef_d.cooking_time =
      mealkit_chef_d.allergen =
      mealkit_chef_d.cuisine =
      mealkit_chef_d.food_category =
    end
  end

  def self.scrape_fresh_direct
    doc = Nokogiri::HTML(open("https://www.freshdirect.com/browse.jsp?pageType=browse&id=meals_kits_meals"))

      doc.css(div mealkits_products_list).text
      list.meal_kits_2 = doc.css(div ).text
      list.meal_kits_2.each do |meal_kit|
      #  meal_kit_2.name =
      #  meal_kit_2.price =
      #  meal_kit_2.skill_level =

      #  meal_kit_2.meal_type =
      #  meal_kit_2.cooking_time =
      #  meal_kit_2.allergen =
      #  meal_kit_2.cuisine =
      #  meal_kit_2.food_category =
  end
end

  def self.scrape_chefday
    doc = Nokogiri::HTML(open("http://www.chefday.com/recipes"))

    list.meal_kits_3 = doc.css(div ).text
    list.meal_kits_3.each do |meal_kit|
    #  meal_kit_3.name =
    #  meal_kit_3.price =
    #  meal_kit_3.skill_level =

    #  meal_kit_3.meal_type =
    #  meal_kit_3.cooking_time =
    #  meal_kit_3.allergen =
    #  meal_kit_3.cuisine =
    #  meal_kit_3.food_category =
    end
  end

end
