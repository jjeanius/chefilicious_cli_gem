class ChefiliciousCliGem::Meal_Kits
  attr_accessor :name, :price, :skill_level, :cooking_time, :allergen, :url, :meal_kits, :meal_type, :cuisine, :food_category, :img
  @@all = []

  def self.scrape_all

    # Go to Chef'D, Chefday, Fresh_Direct find the information
    # extract the properties
    # instantiate meal_kit

    self.scrape_chef_d
    self.scrape_chefd_chefs
    #self.scrape_chefday
end

  def self.scrape_chef_d
    doc = Nokogiri::HTML(open("https://www.chefd.com/collections/all?sort_by=best-selling"))
    meal_kits_chef_d = doc.css("div.grid.grid--uniform.grid--view-items.product-list div.grid__item.small--one-half.medium-up--one-third.product-item")
    meal_kits_chef_d.each do|mealkit_chef_d|
      mealkit = self.new
      mealkit.name = mealkit_chef_d.css("a").attribute("data-name").value
      mealkit.price = mealkit_chef_d.css("button").text.gsub(/\n/,"").strip  # need to work on spacing
      mealkit.skill_level = mealkit_chef_d.attribute("data-skill_level").value
      mealkit.url = "https://www.chefd.com#{mealkit_chef_d.css('a').attribute('href').text.strip}"
      mealkit.meal_type = mealkit_chef_d.attribute("data-type_of_meal")
      mealkit.cooking_time = mealkit_chef_d.css("span").text.strip  # Need to remove "Net Carbs940For 2 For 4 "
      mealkit.allergen = mealkit_chef_d.attribute("data-allergens")
      mealkit.cuisine = mealkit_chef_d.attribute("data-cuisine")
      mealkit.food_category = mealkit_chef_d.attribute("data-proteins")
      #mealkit.description = mealkit_chef_d.css("p").attribute("description")
      @@all << mealkit
    end
  end

  def self.scrape_chefd_chefs
    doc = Nokogiri::HTML(open("https://www.chefd.com/pages/our-chefs"))
    meal_kits_chefd_chefs = doc.css("div#chefsGrid.che-grid div.chef-details")
    meal_kits_chefd_chefs.each do|mealkit_chef|
      mealkit_chef = self.new
      mealkit_chef.chefname = mealkit_chef.attribute("chef-name")
      mealkit_chef.knowfor = mealkit_chef.attribute("chef-description")
      mealkit_chef.description = mealkit_chef.attribute("p.description")
      @@all << mealkit_chef
    end
  end

#  def self.scrape_chefday
#    doc = Nokogiri::HTML(open("http://www.chefday.com/recipes"))
#    meal_kits_chefday = doc.css("ul div#left-side")
#    #meal_kits_chefday = doc.css("div").text
#    meal_kits_chefday.each do |mealkit_chefday|
#      binding.pry
#    mealkit_chefday.name = mealkit_chefday.css("h1.name")
#    mealkit_chefday.price = mealkit_chefday.css("div.serving-price")
#    mealkit_chefday.skill_level = mealkit_chefday.css("span.min-cap")
#
#    #mealkit_chefday.meal_type = mealkit_chefday.css("
#    mealkit_chefday.cooking_time = mealkit_chefday.css("time").totalTime("time")
#    mealkit_chefday.allergen = mealkit_chefday.css("  ")
#    mealkit_chefday.cuisine = mealkit_chefday.css("  ")
#    mealkit_chefday.food_category = mealkit_chefday.css(" ")
#    mealkit_chefday.url = mealkit_chef_d.css("a").attribute("href")
#    end
#  end

end
